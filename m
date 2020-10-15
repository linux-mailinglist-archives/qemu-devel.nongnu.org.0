Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id ED33F28F7BB
	for <lists+qemu-devel@lfdr.de>; Thu, 15 Oct 2020 19:42:52 +0200 (CEST)
Received: from localhost ([::1]:40060 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kT7HA-0000kq-2t
	for lists+qemu-devel@lfdr.de; Thu, 15 Oct 2020 13:42:52 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:56006)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vr_qemu@t-online.de>)
 id 1kT7ES-0008Tv-G3
 for qemu-devel@nongnu.org; Thu, 15 Oct 2020 13:40:07 -0400
Received: from mailout05.t-online.de ([194.25.134.82]:33500)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vr_qemu@t-online.de>)
 id 1kT7EM-0007Zp-Sq
 for qemu-devel@nongnu.org; Thu, 15 Oct 2020 13:40:04 -0400
Received: from fwd30.aul.t-online.de (fwd30.aul.t-online.de [172.20.26.135])
 by mailout05.t-online.de (Postfix) with SMTP id 3C3484263F44;
 Thu, 15 Oct 2020 19:39:55 +0200 (CEST)
Received: from [192.168.211.200]
 (rfljIvZDohXF58dbtG4rKkUnw8NhnEZdQEHUUagWOZWyoTDIN7M4QbeBO21e98oQoh@[93.236.145.148])
 by fwd30.t-online.de
 with (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384 encrypted)
 esmtp id 1kT7EG-17G7jk0; Thu, 15 Oct 2020 19:39:52 +0200
From: =?UTF-8?Q?Volker_R=c3=bcmelin?= <vr_qemu@t-online.de>
Subject: Re: [PATCH 0/7] build: replace ninjatool with ninja
To: Howard Spoelstra <hsp.cat7@gmail.com>, Paolo Bonzini <pbonzini@redhat.com>
References: <20201014135416.1290679-1-pbonzini@redhat.com>
 <CABLmASGJOFbYUhSAbKhc9s1G00Jh0vN--WaFPtaoHqsL2WuvbQ@mail.gmail.com>
 <44d3eccf-3c64-82cd-b5b2-641de6960ab5@redhat.com>
 <CABLmASE55n6h=fr8UrKOHdu1Z_P-46a9t4L0KaRxvvf0hob01w@mail.gmail.com>
Message-ID: <214e983c-b9e8-d03d-099e-d8fe506e6a7b@t-online.de>
Date: Thu, 15 Oct 2020 19:39:51 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.3.2
MIME-Version: 1.0
In-Reply-To: <CABLmASE55n6h=fr8UrKOHdu1Z_P-46a9t4L0KaRxvvf0hob01w@mail.gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Content-Language: en-US
X-ID: rfljIvZDohXF58dbtG4rKkUnw8NhnEZdQEHUUagWOZWyoTDIN7M4QbeBO21e98oQoh
X-TOI-EXPURGATEID: 150726::1602783592-00014A27-2C3A7D01/0/0 CLEAN NORMAL
X-TOI-MSGID: 10a4d941-a9fd-4271-aa84-b6e4e017fb6f
Received-SPF: none client-ip=194.25.134.82; envelope-from=vr_qemu@t-online.de;
 helo=mailout05.t-online.de
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/10/15 13:39:55
X-ACL-Warn: Detected OS   = Linux 3.11 and newer [fuzzy]
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, FREEMAIL_FROM=0.001,
 NICE_REPLY_A=-1.019, RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H3=0.001,
 RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001,
 SPF_NONE=0.001 autolearn=ham autolearn_force=no
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
Cc: =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>,
 =?UTF-8?Q?Daniel_P=2e_Berrang=c3=a9?= <berrange@redhat.com>,
 qemu-devel <qemu-devel@nongnu.org>, Peter Maydell <peter.maydell@linaro.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


>
> Thanks Paolo,
>
> Then only the issue regarding the pcbios/optionrom stuff remains ;-)
>
> make[1]: *** No rule to make target 'multiboot.bin', needed by 'all'.  Stop.
> make: *** [Makefile:171: pc-bios/optionrom/all] Error 2
> make: *** Waiting for unfinished jobs....
>
> Best,
> Howard
>

Hi Howard,

one solution for this issue is to uncomment the following line in msys2_shell.cmd.

rem To activate windows native symlinks uncomment next line
set MSYS=winsymlinks:nativestrict

Then tell Windows 10 it's okay to create symlinks without elevated rights. Here is a link with a description how to do this.
https://www.joshkel.com/2018/01/18/symlinks-in-windows/

I think since commit bf708f3c4a "optionrom: simplify Makefile" pc-bios/optionrom/Makefile in your build directory has to be a symbolic link. Without 'set MSYS=winsymlinks:nativestrict' msys2 ln -s copies the Makefile instead of creating a symbolic link.

With best regards,
Volker


