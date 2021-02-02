Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9BEE030C463
	for <lists+qemu-devel@lfdr.de>; Tue,  2 Feb 2021 16:52:39 +0100 (CET)
Received: from localhost ([::1]:37526 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l6xyo-0008Sf-O7
	for lists+qemu-devel@lfdr.de; Tue, 02 Feb 2021 10:52:38 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:34090)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1l6xdn-0005Ex-1w
 for qemu-devel@nongnu.org; Tue, 02 Feb 2021 10:30:55 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:52095)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1l6xdk-0006su-5Y
 for qemu-devel@nongnu.org; Tue, 02 Feb 2021 10:30:54 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1612279850;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=PYOtGvKIa4XPSVdJB/dGjrRIYDvtCMjqkIgVSiIBN50=;
 b=WHLykQQtduawjbcmniEu+9oGWLr96JE4kve+Z809yjPs/RKBZbPIgmDznyjGowJdull7/Q
 6xkZHRIdyPuOCZUnQcMLPWrz5hjDApdKa+PQhvFFmTqgRQryZ9rQj/UHUlVyHaWT6K1nyF
 xV8BxoXBAtjUolVbS08Pb+v6o0B6C+Y=
Received: from mail-ej1-f69.google.com (mail-ej1-f69.google.com
 [209.85.218.69]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-594-NXP17ikyMDaeBDqyuAultA-1; Tue, 02 Feb 2021 10:30:49 -0500
X-MC-Unique: NXP17ikyMDaeBDqyuAultA-1
Received: by mail-ej1-f69.google.com with SMTP id n25so10161634ejd.5
 for <qemu-devel@nongnu.org>; Tue, 02 Feb 2021 07:30:48 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=PYOtGvKIa4XPSVdJB/dGjrRIYDvtCMjqkIgVSiIBN50=;
 b=CFQotYPrz72bXPMmLPPGJIzlNk4lqsNwzmwtxiah+Fybve3WeUUT6+HoZkIC9OGscC
 ms9thlLbSQegvpFtNGhmRn4haqJ9PsfwygoXKJSqASoi/yPDbVIHm9/o94EJlv/+i8MW
 9AkWTRcbYxeNPczuO1JKc/QDUbxLu5/XlEXBZsXI+sX5ShR/auKMvSofswkata+L/Ff7
 1CZpW7rDVueI+rIDp8d4JCKktqo1DINvbDiK6+WjVjGyhoedJ4yrn5B4FEm386ZsNfvm
 6pHSqH6S+g188rcccjgJgg4Fb+esn4Q4NkVBZJKsxwi+4fS89Gc+PVFkpEfxFR7IPjsm
 W9DQ==
X-Gm-Message-State: AOAM533KddUyIU0kZEUNZ44vrUdIzNswdr9ge64c61U+lRx/Ljyo67t0
 G9n02mdKq8LpHgppsqSze/bcEtKdwRLVjSjEinZV0JzDVIBMm1avCRXIqCchlErP9buRhWLnpA0
 AdpxtmcrIu9R2DQS6OoRhYfRzn7c2SpIZOOn8BMAQuHH+8zvZHcz4FNTaNN2oM2cvCu8=
X-Received: by 2002:a17:907:1610:: with SMTP id
 hb16mr219897ejc.266.1612279847488; 
 Tue, 02 Feb 2021 07:30:47 -0800 (PST)
X-Google-Smtp-Source: ABdhPJxABgrsY2iE1nL5nkf8M/l1RWWay/c2zOyiwDoastxi3/U0bnUOYEV1K/xAR+f+QXVRXpJd0Q==
X-Received: by 2002:a17:907:1610:: with SMTP id
 hb16mr219870ejc.266.1612279847192; 
 Tue, 02 Feb 2021 07:30:47 -0800 (PST)
Received: from ?IPv6:2001:b07:6468:f312:c8dd:75d4:99ab:290a?
 ([2001:b07:6468:f312:c8dd:75d4:99ab:290a])
 by smtp.gmail.com with ESMTPSA id z22sm10025204edb.88.2021.02.02.07.30.45
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 02 Feb 2021 07:30:46 -0800 (PST)
Subject: Re: [PULL v3 00/38] Misc patches (buildsys, i386, fuzzing) for
 2021-01-29
To: Peter Maydell <peter.maydell@linaro.org>
References: <20210202074644.89637-1-pbonzini@redhat.com>
 <CAFEAcA87JXmZL6yBawnO9y6XT+kwFz1_D9EqC3t7XVZu8+z8Ow@mail.gmail.com>
From: Paolo Bonzini <pbonzini@redhat.com>
Message-ID: <7116dc30-1cfe-e688-d618-77d8a2e202a0@redhat.com>
Date: Tue, 2 Feb 2021 16:30:44 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.6.0
MIME-Version: 1.0
In-Reply-To: <CAFEAcA87JXmZL6yBawnO9y6XT+kwFz1_D9EqC3t7XVZu8+z8Ow@mail.gmail.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=pbonzini@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=63.128.21.124; envelope-from=pbonzini@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -32
X-Spam_score: -3.3
X-Spam_bar: ---
X-Spam_report: (-3.3 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.386,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.155, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001,
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
Cc: QEMU Developers <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 02/02/21 14:56, Peter Maydell wrote:
> On Tue, 2 Feb 2021 at 07:48, Paolo Bonzini <pbonzini@redhat.com> wrote:
>>
>> The following changes since commit 74208cd252c5da9d867270a178799abd802b9338:
>>
>>    Merge remote-tracking branch 'remotes/berrange-gitlab/tags/misc-fixes-pull-request' into staging (2021-01-29 19:51:25 +0000)
>>
>> are available in the Git repository at:
>>
>>    https://gitlab.com/bonzini/qemu.git tags/for-upstream
>>
>> for you to fetch changes up to a365bda83444f142bb1b9c1b5fdcdefade87981d:
>>
>>    pc-bios/descriptors: fix paths in json files (2021-02-01 17:30:52 +0100)
>>
>> ----------------------------------------------------------------
>> * Fuzzing improvements (Qiuhao, Alexander)
>> * i386: Fix BMI decoding for instructions with the 0x66 prefix (David)
>> * slirp update (Marc-André)
>> * initial attempt at fixing event_notifier emulation (Maxim)
>> * i386: PKS emulation, fix for "qemu-system-i386 -cpu host" (myself)
>> * meson: RBD test fixes (myself)
>> * meson: TCI warnings (Philippe)
>> * Leaner build for --disable-guest-agent, --disable-system and
>>    --disable-tools (Philippe, Stefan)
>> * --enable-tcg-interpreter fix (Richard)
>> * i386: SVM feature bits (Wei)
>> * HVF bugfix (Alex)
>> * KVM bugfix (Thomas)
> 
> Fails to build, x86-64 Linux clang.
> (configure rune:
>   '../../configure' '--cc=clang' '--cxx=clang++' '--enable-gtk'
> '--extra-cflags=-fsanitize=undefined  -fno-sanitize=shift-base
> -Werror')
> 
> clang  -o subprojects/libslirp/libslirp.so.0.2.3
> subprojects/libslirp/libslirp.so.0.2.3.p/src_arp_table.c.o
> subprojects/libslirp/libslirp.so.0.2.3.p/src_bootp.c.o
> subprojects/libslirp/libslirp.so.0.2.3.p/src_cksum.c.o
> subprojects/libslirp/libslirp.so.0.2.3.p/src_dhcpv6.c.o
> subprojects/libslirp/libslirp.so.0.2.3.p/src_dnssearch.c.o
> subprojects/libslirp/libslirp.so.0.2
> .3.p/src_if.c.o
> subprojects/libslirp/libslirp.so.0.2.3.p/src_ip6_icmp.c.o
> subprojects/libslirp/libslirp.so.0.2.3.p/src_ip6_input.c.o
> subprojects/libslirp/libslirp.so.0.2.3.p/src_ip6_output.c.o
> subprojects/libslirp/libslirp.so.0.2.3.p/src_ip_icmp.c.o
> subprojects/libslirp/libslirp.so.0.2.3.p/src_ip_input.c.o
> subprojects/libslirp/libslirp.so.0.2.3.p/src_ip_output.c.o
> subprojects/libslirp/libslirp.so.0.2.3.p/src_mbuf.c.o
> subprojects/libslirp/libslirp.so.0.2.3.p/src_misc.c.o
> subprojects/libslirp/libslirp.so.0.2.3.p/src_ncsi.c.o
> subprojects/libslirp/libslirp.so.0.2.3.p/src_ndp_table.c.o
> subprojects/libslirp/libslirp.so.0.2.3.p/src_sbuf.c.o
> subprojects/libslirp/libslirp.so.0.2.3.p/src_slirp.c.o
> subprojects/libslirp/libslirp.so.0.2.3.p/
> src_socket.c.o subprojects/libslirp/libslirp.so.0.2.3.p/src_state.c.o
> subprojects/libslirp/libslirp.so.0.2.3.p/src_stream.c.o
> subprojects/libslirp/libslirp.so.0.2.3.p/src_tcp_input.c.o
> subprojects/libslirp/libslirp.so.0.2.3.p/src_tcp_output.c.o
> subprojects/libslirp/libslirp.so.0.2.3.p/src_tcp_subr.c.o
> subprojects/libslirp/libslirp.so.0.2.3.p/src_tcp_timer.c.o
> subprojects/libslirp/libslirp.so.0.2.3.p/src_tftp.c.o
> subprojects/libslirp/libslirp.so.0.2.3.p/src_udp.c.o
> subprojects/libslirp/libslirp.so.0.2.3.p/src_udp6.c.o
> subprojects/libslirp/libslirp.so.0.2.3.p/src_util.c.o
> subprojects/libslirp/libslirp.so.0.2.3.p/src_version.c.o
> subprojects/libslirp/libslirp.so.0.2.3.p/src_vmstate.c.o
> -Wl,--as-needed -Wl,--no-undefined -shared -fPIC -Wl,--start-group
> -Wl,-soname,libslirp.so.0 -Wl,--warn-common -Wl,-z,relro -Wl,-z,now
> -m64 -fsanitize=undefined -fno-sanitize=shift-base -Werror
> -fstack-protector-strong
> -Wl,--version-script,/home/petmay01/linaro/qemu-for-merges/subprojects/libslirp/src/libslirp.map
> -pthread -lgthread-2.0 -lglib-2.0 -Wl,--end-group
> subprojects/libslirp/libslirp.so.0.2.3.p/src_arp_table.c.o: In
> function `arp_table_add':
> /home/petmay01/linaro/qemu-for-merges/build/clang/../../subprojects/libslirp/src/arp_table.c:50:
> undefined reference to `__ubsan_handle_type_mismatch_v1'
> /home/petmay01/linaro/qemu-for-merges/build/clang/../../subprojects/libslirp/src/arp_table.c:50:
> undefined reference to `__ubsan_handle_type_mismatch_v1'
> [etc etc etc]
> /home/petmay01/linaro/qemu-for-merges/build/clang/../../subprojects/libslirp/src/arp_table.c:52:
> undefined reference to `__ubsan_handle_nonnull_arg'
> /home/petmay01/linaro/qemu-for-merges/build/clang/../../subprojects/libslirp/src/arp_table.c:58:
> undefined reference to `__ubsan_handle_type_mismatch_v1'
> [etc etc etc]
> 
> and so on for lots of other libslirp files and ubsan symbols.

Hmm, that should have been taken care of by

     libslirp = subproject('libslirp',
                           default_options: ['default_library=static'])


I'll just drop this change.

Paolo


