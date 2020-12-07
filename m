Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3D0EB2D1028
	for <lists+qemu-devel@lfdr.de>; Mon,  7 Dec 2020 13:12:53 +0100 (CET)
Received: from localhost ([::1]:53628 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kmFNs-0002jx-9q
	for lists+qemu-devel@lfdr.de; Mon, 07 Dec 2020 07:12:52 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:39788)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <cfontana@suse.de>) id 1kmEgW-0005H8-Oy
 for qemu-devel@nongnu.org; Mon, 07 Dec 2020 06:28:05 -0500
Received: from mx2.suse.de ([195.135.220.15]:48990)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <cfontana@suse.de>) id 1kmEgJ-0005cT-C6
 for qemu-devel@nongnu.org; Mon, 07 Dec 2020 06:28:02 -0500
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 82A9CAD1E;
 Mon,  7 Dec 2020 11:27:48 +0000 (UTC)
Subject: Re: Why do we have both CONFIG_SOFTMMU and CONFIG_USER_ONLY?
To: Paolo Bonzini <pbonzini@redhat.com>
References: <5176c935-2df0-e300-b1cf-67c7014e5d73@suse.de>
 <03bdd8fe-53cf-e2d9-cdc8-fd1a22b49941@redhat.com>
From: Claudio Fontana <cfontana@suse.de>
Message-ID: <4009cae8-2b88-8a54-48f3-11ae561e6a23@suse.de>
Date: Mon, 7 Dec 2020 12:27:47 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.12.0
MIME-Version: 1.0
In-Reply-To: <03bdd8fe-53cf-e2d9-cdc8-fd1a22b49941@redhat.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=195.135.220.15; envelope-from=cfontana@suse.de;
 helo=mx2.suse.de
X-Spam_score_int: -41
X-Spam_score: -4.2
X-Spam_bar: ----
X-Spam_report: (-4.2 / 5.0 requ) BAYES_00=-1.9, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_MED=-2.3, RCVD_IN_MSPIKE_H3=-0.01, RCVD_IN_MSPIKE_WL=-0.01,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>,
 qemu-devel <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 12/7/20 12:26 PM, Paolo Bonzini wrote:
> On 07/12/20 12:19, Claudio Fontana wrote:
>> As in Subject,
>>
>> am I understanding correctly that the one or the other is redundant?
>>
>> Should we keep only one of them?
> 
> In the code it's not strictly necessary.  However in both Makefiles and 
> meson.build it made/makes things a bit clearer.
> 
> Paolo
> 

K.. thanks a lot, maybe we should document all of this stuff in docs/devel/...

Ciao,

Claudio

