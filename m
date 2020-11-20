Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 09F832BAACB
	for <lists+qemu-devel@lfdr.de>; Fri, 20 Nov 2020 14:06:49 +0100 (CET)
Received: from localhost ([::1]:38864 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kg67k-00015r-4i
	for lists+qemu-devel@lfdr.de; Fri, 20 Nov 2020 08:06:48 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:57288)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1kg66S-0000C8-0R
 for qemu-devel@nongnu.org; Fri, 20 Nov 2020 08:05:28 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:49974)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1kg66M-0008RW-PQ
 for qemu-devel@nongnu.org; Fri, 20 Nov 2020 08:05:26 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1605877521;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=JD7ghbgjngAFT7Rpfolu8FKx4qcobUHMp9ezKblsc/s=;
 b=NTqOvSgDjcrLENPnlVmKqhpZvtHkl3KOIl0/ZlE0DzI2BeZj2Uwg47wTLfbWw+2utz+7fr
 hQJKfiFembW1M031V1MIesSliU3HMiMiYmanik08pLA4KwaQwtE/iCZw/+13iQ1fpUxVHW
 xiphheYti5RCNAjoEdbEoKArWP/Zjh0=
Received: from mail-ej1-f71.google.com (mail-ej1-f71.google.com
 [209.85.218.71]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-251-ofHdFdYpNHOVHEuNx2EKsg-1; Fri, 20 Nov 2020 08:05:17 -0500
X-MC-Unique: ofHdFdYpNHOVHEuNx2EKsg-1
Received: by mail-ej1-f71.google.com with SMTP id lz20so3437228ejb.13
 for <qemu-devel@nongnu.org>; Fri, 20 Nov 2020 05:05:16 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:to:cc:references:from:subject:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=JD7ghbgjngAFT7Rpfolu8FKx4qcobUHMp9ezKblsc/s=;
 b=Who7Tyuovpx43X4pGqw/FlA+FdpS6Sxh4DevQgIbCXLSnTBv+O7QtqKRT/Njwm9ctf
 2Z02sRuixPZaJjzD/ooBbR5eYr3ucEkc9U+KbxKZvp01Do62SLbb/f74gh14Qcy7F1OZ
 Fz0d4xIi5DOPwaNzL2A9hdF6hHr0G8Yk9jbN4voWbyXbawIBV4WuHJ3nPV79iHSKkc7z
 wyNk5yFaU0Wps9g1mdDYQehT+5EBRpaExK6IZ4OmNJYq2zD2eAy9jKJL7hsAmIVhcyUb
 O3rdHhBL928ahlti8qC0bNIxpliRDgE2Yz2FxNnW4sK8lsWt7/WrAQWM9vzpaeI2wJ97
 2ZDQ==
X-Gm-Message-State: AOAM531fuEGX5wYwvcT5xUAJG1HLf2X8ejEtQBQ7pBtcaazaxMqOxy9X
 5oiYQe5OXirAxYXlUvEdNDYxU8V+2pBaxguSNCPvR2NwZODyDgdeXCZuUU0ufFN/CxBMzyQnTPL
 rqtX6U8fnYYVIncG+EGuZ0cVFpmq9up6qSBASXXm+p9S3jlhAPwbfti6/r1z+75Ywa5M=
X-Received: by 2002:a05:6402:22ab:: with SMTP id
 cx11mr33614515edb.98.1605877515588; 
 Fri, 20 Nov 2020 05:05:15 -0800 (PST)
X-Google-Smtp-Source: ABdhPJxcl/+4mAyVSgpqRUz/qoM7R5bRN7R8Cr5DabgsH2eSlrB8r74DfqYtiJskQYD9XKf9WuRK5A==
X-Received: by 2002:a05:6402:22ab:: with SMTP id
 cx11mr33614491edb.98.1605877515270; 
 Fri, 20 Nov 2020 05:05:15 -0800 (PST)
Received: from ?IPv6:2001:b07:6468:f312:c8dd:75d4:99ab:290a?
 ([2001:b07:6468:f312:c8dd:75d4:99ab:290a])
 by smtp.gmail.com with ESMTPSA id dk4sm1078096edb.54.2020.11.20.05.05.14
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 20 Nov 2020 05:05:14 -0800 (PST)
To: Gerd Hoffmann <kraxel@redhat.com>, Stefan Hajnoczi <stefanha@redhat.com>
References: <20201119084448.24397-1-kraxel@redhat.com>
 <20201119084448.24397-5-kraxel@redhat.com>
 <20201119110316.GG701869@stefanha-x1.localdomain>
 <20201119112323.3rcfmee2jm3uw3ym@sirius.home.kraxel.org>
 <20201119115514.GA838600@stefanha-x1.localdomain>
 <20201120102355.mayek7z4ud5orqme@sirius.home.kraxel.org>
 <20201120112539.bsyjsfrqxz4ffo4r@sirius.home.kraxel.org>
From: Paolo Bonzini <pbonzini@redhat.com>
Subject: Re: [PATCH 4/4] [broken] meson: try link tracepoints to module
Message-ID: <389b0932-794c-536f-4e8d-3f91ef7fb3ba@redhat.com>
Date: Fri, 20 Nov 2020 14:05:13 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.4.0
MIME-Version: 1.0
In-Reply-To: <20201120112539.bsyjsfrqxz4ffo4r@sirius.home.kraxel.org>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=pbonzini@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=pbonzini@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H3=0.001,
 RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 20/11/20 12:25, Gerd Hoffmann wrote:
>    Hi,
> 
>> Guess I'll go dig into the meson documentation, this looks more like a
>> build system than a tracing problem to me.
> 
> Looking at https://mesonbuild.com/Syntax.html ...
> 
> "all objects are immutable".
> 
> So "var2 = var1" creates a copy not a reference I guess?
> 
> Which implies that ...
> 
> 	foo_ss.add(something)
> 
> ... is different from ...
> 
> 	bar_ss = foo_ss
> 	bar_ss.add(something)
> 
> ... which in turn explains why the patch doesn't work at all.
> 
> Now I'm wondering how I can make trace/meson.build add the trace
> objects to the module source sets if I can't pass around references
> to the module source sets?
> 
> Paolo?  Any hints how to tackle this the meson way?

You could build a separate dictionary in trace/meson.build.  Instead of 
using the 'hw_display_qxl' group, you use the module name i.e. 
'hw-display-qxl'.  trace/meson.build does:

   module_trace = {}

and in trace/meson.build

   module_trace_src = []
   foreach c : ...
     ...
     group = '--group=' + c['name'].underscorify()
     module_trace_src += [trace_h, trace_c]
     ...
     module_trace += { c['name']: module_trace_src }
   endforeach

Then when building the shared_module you add the trace files to the 
sources, like

    module_trace_src = module_trace.get(d + '-' + m, [])
    sl = static_library(d + '-' + m,
                        [genh, module_ss.sources(), module_trace_src],
                        dependencies: ...)

Paolo


