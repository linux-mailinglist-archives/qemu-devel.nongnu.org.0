Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id AC3CD2BBE99
	for <lists+qemu-devel@lfdr.de>; Sat, 21 Nov 2020 12:11:40 +0100 (CET)
Received: from localhost ([::1]:41058 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kgQnr-0001my-7D
	for lists+qemu-devel@lfdr.de; Sat, 21 Nov 2020 06:11:39 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:47636)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <sw@weilnetz.de>) id 1kgQmz-000145-Fp
 for qemu-devel@nongnu.org; Sat, 21 Nov 2020 06:10:45 -0500
Received: from mail.weilnetz.de ([37.120.169.71]:37280
 helo=v2201612906741603.powersrv.de)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <sw@weilnetz.de>) id 1kgQmx-00027Q-A7
 for qemu-devel@nongnu.org; Sat, 21 Nov 2020 06:10:45 -0500
Received: from localhost (localhost [127.0.0.1])
 by v2201612906741603.powersrv.de (Postfix) with ESMTP id EE434DA0F1D;
 Sat, 21 Nov 2020 12:10:40 +0100 (CET)
X-Virus-Scanned: Debian amavisd-new at v2201612906741603.powersrv.de
Received: from v2201612906741603.powersrv.de ([127.0.0.1])
 by localhost (v2201612906741603.powersrv.de [127.0.0.1]) (amavisd-new,
 port 10024)
 with ESMTP id KyNdqofwe3OF; Sat, 21 Nov 2020 12:09:57 +0100 (CET)
Received: from edv-macbook-pro.fritz.box (p57b420e8.dip0.t-ipconnect.de
 [87.180.32.232])
 (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by v2201612906741603.powersrv.de (Postfix) with ESMTPSA id 04E8FDA1255;
 Sat, 21 Nov 2020 12:09:57 +0100 (CET)
Subject: Re: Regressions in build process introduced since August
From: Stefan Weil <sw@weilnetz.de>
To: Paolo Bonzini <pbonzini@redhat.com>,
 Stefano Garzarella <sgarzare@redhat.com>
References: <97b04446-ca94-cebd-2d8d-4c2013521208@weilnetz.de>
 <20201117175030.eqz5run2m7qmx5qt@steredhat>
 <a6c8de1a-da41-1a4a-8907-790c2467a0b0@redhat.com>
 <ee31c6f2-19dd-f3f6-d916-f04490909dd8@weilnetz.de>
Message-ID: <d69b024e-9762-2b27-b558-0c60b3e96811@weilnetz.de>
Date: Sat, 21 Nov 2020 12:09:56 +0100
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.16; rv:78.0)
 Gecko/20100101 Thunderbird/78.4.3
MIME-Version: 1.0
In-Reply-To: <ee31c6f2-19dd-f3f6-d916-f04490909dd8@weilnetz.de>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=37.120.169.71; envelope-from=sw@weilnetz.de;
 helo=v2201612906741603.powersrv.de
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, NICE_REPLY_A=-0.001,
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
Cc: =?UTF-8?Q?Marc-Andr=c3=a9_Lureau?= <marcandre.lureau@redhat.com>,
 qemu-devel <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Am 21.11.20 um 11:25 schrieb Stefan Weil:

> Hi,
>
> I just noticed another regression:
>
> A cross build targeting Windows no longer detects VNC JPEG support. 
> Using pkg-config like in the patch below would fix that (and also 
> works for native builds on Debian GNU Linux).
>
> Maybe the current find_library ignores --extra-cflags and 
> --extra-ldflags? That would explain why it fails to find the required 
> header and library files. Other checks would fail then, too.
>
> Regards,
>
> Stefan
>
>
> --- a/meson.build
> +++ b/meson.build
> @@ -649,9 +649,8 @@ if get_option('vnc').enabled()
>    vnc = declare_dependency() # dummy dependency
>    png = dependency('libpng', required: get_option('vnc_png'),
>                     method: 'pkg-config', static: enable_static)
> -  jpeg = cc.find_library('jpeg', has_headers: ['jpeglib.h'],
> -                         required: get_option('vnc_jpeg'),
> -                         static: enable_static)
> +  jpeg = dependency('libpng', required: get_option('vnc_jpeg'),

Copy+paste error:

s/libpng/libjpeg/

> + method: 'pkg-config', static: enable_static)
>    sasl = cc.find_library('sasl2', has_headers: ['sasl/sasl.h'],
>                           required: get_option('vnc_sasl'),
>                           static: enable_static)

