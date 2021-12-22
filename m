Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0F1CF47CCBB
	for <lists+qemu-devel@lfdr.de>; Wed, 22 Dec 2021 06:57:54 +0100 (CET)
Received: from localhost ([::1]:45904 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mzudM-0007SN-Jo
	for lists+qemu-devel@lfdr.de; Wed, 22 Dec 2021 00:57:52 -0500
Received: from eggs.gnu.org ([209.51.188.92]:50782)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mkfssion@mkfssion.com>)
 id 1mzuaL-0006g0-Si
 for qemu-devel@nongnu.org; Wed, 22 Dec 2021 00:54:45 -0500
Received: from mail-108-mta107.mxroute.com ([136.175.108.107]:35357)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <mkfssion@mkfssion.com>)
 id 1mzuaJ-0002c4-Vw
 for qemu-devel@nongnu.org; Wed, 22 Dec 2021 00:54:45 -0500
Received: from filter004.mxroute.com ([149.28.56.236] filter004.mxroute.com)
 (Authenticated sender: mN4UYu2MZsgR)
 by mail-108-mta107.mxroute.com (ZoneMTA) with ESMTPSA id
 17de0b4b5d4000b7bf.001 for <qemu-devel@nongnu.org>
 (version=TLSv1/SSLv3 cipher=ECDHE-RSA-AES128-GCM-SHA256);
 Wed, 22 Dec 2021 05:54:39 +0000
X-Zone-Loop: ae10609d02c199b7bfca70d3e9f01ad13940c217332d
X-Originating-IP: [149.28.56.236]
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=mkfssion.com; s=x; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
 From:References:To:Subject:MIME-Version:Date:Message-ID:Sender:Reply-To:Cc:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=OFFvUO/r+jJKv3OgVxx5avsdcKeR9xV22kEAKDW79H4=; b=gIR9jbXkm+5A+kVEE0sNINyCJ7
 LCYpBI4/d6oqGJpUuDRNja2X/T704TjP1brgNQTIGz2R8BkGNX9bzA+2OhNeS+NYfFYbWxwXBlstS
 SF1njZmKtVYkSSDksqMn3tamsH+/tmjfC6NyiuDYMt4zIwfb2/Dt4uUYdOJyazKMdwqhEOUPqUhn0
 3Rzwj/vv0PScZV1DC78kk9GweJO7iZoFUEzL6FZb6SVBZnHjHTu4qswwbVQujVqluuf3lXJvHMa56
 EOEOgPwqwv51vd5zO4NHD24ulKf+hMFDGr1DofMeFWPxF6kEFBbD3Vjr5ChTuKkIouY4wjz0NRJ01
 hucZDPYw==;
Message-ID: <f50292bb-09e7-b307-88c6-5d54b6ee5123@mkfssion.com>
Date: Wed, 22 Dec 2021 13:54:33 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.4.1
Subject: Re: [PATCH] vl: Add -set options to device opts dict when using JSON
 syntax for -device
Content-Language: en-US
To: Markus Armbruster <armbru@redhat.com>, qemu-devel@nongnu.org
References: <20211221071818.34731-1-mkfssion@mkfssion.com>
 <877dbyjj0t.fsf@dusky.pond.sub.org>
From: MkfsSion <mkfssion@mkfssion.com>
In-Reply-To: <877dbyjj0t.fsf@dusky.pond.sub.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-AuthUser: mkfssion@mkfssion.com
X-Zone-Spam-Resolution: no action
X-Zone-Spam-Status: No, score=-0.1, required=15, tests=[ARC_NA=0,
 RCPT_COUNT_TWO=0, FROM_HAS_DN=0, TO_DN_SOME=0, MIME_GOOD=-0.1,
 FROM_EQ_ENVFROM=0, MIME_TRACE=0, RCVD_COUNT_ZERO=0, NEURAL_SPAM=0,
 MID_RHS_MATCH_FROM=0]
Received-SPF: pass client-ip=136.175.108.107;
 envelope-from=mkfssion@mkfssion.com; helo=mail-108-mta107.mxroute.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.694,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 2021/12/21 19:26, Markus Armbruster wrote:> Two issues, and only looks fixable.
> 
> -device accepts either a QemuOpts or a JSON argument.
> 
> It parses the former with qemu_opts_parse_noisily() into a QemuOpt
> stored in @qemu_device_opts.
> 
> It parses the latter with qobject_from_json() into a QObject stored in
> @device_opts.  Yes, the names are confusing.
> 
> -set parses its argument into @group, @id, and @arg (the value).
> 
> Before the patch, it uses @group and @id to look up the QemuOpt in
> @qemu_device_opts.  If found, it updates it with qemu_opt_set().
> 
> By design, -set operates on the QemuOpts store.
> 
> Options stored in @device_opts are not found.  Your patch tries to fix
> that.  Before I can explain what's wrong with it, I need more
> background.
> 
> QemuOpts arguments are parsed as a set of (key, value) pairs, where the
> values are all strings (because qemu_device_opts.desc[] is empty).  We
> access them with a qobject_input_visitor_new_keyval() visitor.  This
> parses the strings according to the types being visited.
> 
> Example: key=42 gets stored as {"key": "42"}.  If we visit it with
> visit_type_str(), we use string value "42".  If we visit it with
> visit_type_int() or similar, we use integer value 42.  If we visit it
> with visit_type_number(), we use double value 42.0.  If we visit it with
> something else, we error out.
> 
> JSON arguments are parsed as arbitrary JSON object.  We access them with
> a qobject_input_visitor_new() visitor.  This expects the values to have
> JSON types appropriate for the types being visited.
> 
> Example: {"key": "42"} gets stored as is.  Now everything but
> visit_type_str() errors out.
> 
Thanks for the detailed explanation. Since I am new to QEMU codebase, I did not notice that the visitor is different when -device JSON syntax is used. 
> Back to your patch.  It adds code to look up a QObject in @device_opts.
> If found, it updates it.
> 
> Issue#1: it does so regardless of @group.
> 
> Example:
> 
>     $ qemu-system-x86_64 -nodefaults -S -display none -M q35,usb=on -device '{"driver": "usb-mouse", "id": "ms0"}' -set chardev.ms0.serial=456
> 
> Here, -set chardev... gets misinterpreted as -set device...
> 
Oh, I forgot to match the group name.
> Issue#2 is the value to store in @device_opts.  Always storing a string,
> like in the QemuOpts case, would be wrong, because it works only when
> its accessed with visit_type_str(), i.e. the property is actually of
> string type.
> 
> Example:
> 
>     $ qemu-system-x86_64 -nodefaults -S -display none -M q35,usb=on -device '{"driver": "usb-mouse", "id": "ms0"}' -set device.ms0.serial=123
> 
>     $ qemu-system-x86_64 -nodefaults -S -display none -M q35,usb=on -device '{"driver": "usb-mouse", "id": "ms0"}' -set device.ms0.msos-desc=off
>     qemu-system-x86_64: -device {"driver": "usb-mouse", "id": "ms0"}: Invalid parameter type for 'msos-desc', expected: boolean
> 
> Your patch stores a boolean if possible, else a number if possible, else
> a string.  This is differently wrong.
> 
> Example:
> 
>     $ qemu-system-x86_64 -nodefaults -S -display none -M q35,usb=on -device '{"driver": "usb-mouse", "id": "ms0"}'
> 
> Example:
> 
>     $ qemu-system-x86_64 -nodefaults -S -display none -M q35,usb=on -device '{"driver": "usb-mouse", "id": "ms0"}' -set device.ms0.serial=123
>     qemu-system-x86_64: -device {"driver": "usb-mouse", "id": "ms0", "serial": "123"}: Invalid parameter type for 'serial', expected: string
> 
> I can't see how -set can store the right thing.
> 
> Aside: the error messages refer to -device instead of -set.  Known bug
> in -set, hard to fix.
> There seems no way to know what type of value the property actually take. I am trying to add a QDict* parameter in qdev_device_add_from_qdict() function and set thoses properties via object_set_properties_from_keyval() call but with false option for from_json argument, which will use qobject_input_visitor_new_keyval() visitor for the properties provided via -set option. Maybe the issue can be fixed in that way.

