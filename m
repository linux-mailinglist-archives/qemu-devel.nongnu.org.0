Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id ED88D442F22
	for <lists+qemu-devel@lfdr.de>; Tue,  2 Nov 2021 14:36:09 +0100 (CET)
Received: from localhost ([::1]:41266 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mhtxQ-0003zK-LZ
	for lists+qemu-devel@lfdr.de; Tue, 02 Nov 2021 09:36:08 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:59742)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1mhtw9-0002lK-MC
 for qemu-devel@nongnu.org; Tue, 02 Nov 2021 09:34:49 -0400
Received: from mail-wr1-x42d.google.com ([2a00:1450:4864:20::42d]:36476)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1mhtw7-0007aM-Ex
 for qemu-devel@nongnu.org; Tue, 02 Nov 2021 09:34:49 -0400
Received: by mail-wr1-x42d.google.com with SMTP id s13so26212435wrb.3
 for <qemu-devel@nongnu.org>; Tue, 02 Nov 2021 06:34:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:message-id:date:mime-version:user-agent:subject
 :content-language:from:to:cc:references:in-reply-to
 :content-transfer-encoding;
 bh=2blOZmYBQGtECAGAd+HpTdn6DjZisOUa+4LGTNvqhKE=;
 b=ohn4aF4pBPdy60opL9QbxkmUuvE8rEJvp0xcKlqWizOpdoZtqEm6FmKlM0f4+gA/Fi
 kWJdjffVzvDG5XlivYx3m6vrQ2tBUTWhvVX1ChL+VFWkcqE5E6pp9FIsrbghPbuInvv4
 9bEliSHLTbm7nYrRMEOcJuCQtVv0D+16wpv7Rsv0RtCNde9yt0v8OQvhFh4GnYOSgiGc
 2Kn0if08IQ79YJaEHNdgno4cRuK6ndepa0+gecnsl+utXK+UqISQAlaQzvSDb8tE6nuD
 bEH7sVSteo7ayihJMz0IFWizddtdsYXmpsK132lLCWbmv7VG+9CkQ3jEW/OpsZEdHZMx
 fByQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:sender:message-id:date:mime-version:user-agent
 :subject:content-language:from:to:cc:references:in-reply-to
 :content-transfer-encoding;
 bh=2blOZmYBQGtECAGAd+HpTdn6DjZisOUa+4LGTNvqhKE=;
 b=cUL1KerP1XlnFNuoeJbfqI6VNeQjmZ6irBJZE2Xgu7PbKlqoCCublNMDNyaFHINsgk
 1A0QSxH1Sf+Z5+NlXvPjseYlgAt3rK0CmAMX6hsAcVhCn4UlR6kYSw1eoK9+OX5r9fMp
 IMK/blvpGuvZBoWQAYGVX1IpMl5xRD4vJjfDfzj0naT7pPT0P9/ae2pC6Gk6pfdtIHr8
 m+EUjyoolS1klMfjkZiSKIT6pJDQOsuCcLEyKrnBwrjLlFaIdLQ5ogrhWqBd6dmIoC9q
 Y9tyTXLitvZg+/9o93m6xSRU81XbNn+06KfdhlbyY9fHKd8k8wr3MGpHdH8trLq6Kwcs
 UJvQ==
X-Gm-Message-State: AOAM532IRvoMko/Ff+1eBMMRUu3ein+TNhEeWD9i9EPsUdWYggt3LIle
 fggl/NVjlIQ0vKj3yKCRTB0=
X-Google-Smtp-Source: ABdhPJxlIeNshA3DI/CuWV5AGtyFTW/MQxxS3gloVhbZPS34pT1FAqzZTJDZ0mWjw+TsHwYh0Hlq/A==
X-Received: by 2002:a5d:6a4d:: with SMTP id t13mr18186390wrw.104.1635860085504; 
 Tue, 02 Nov 2021 06:34:45 -0700 (PDT)
Received: from [192.168.1.36] (62.red-83-57-168.dynamicip.rima-tde.net.
 [83.57.168.62])
 by smtp.gmail.com with ESMTPSA id e3sm4137099wrp.8.2021.11.02.06.34.44
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 02 Nov 2021 06:34:44 -0700 (PDT)
Message-ID: <ee1ae9b1-6f93-2cc8-431b-75d0f8f403a1@amsat.org>
Date: Tue, 2 Nov 2021 14:34:43 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.2.0
Subject: Re: [PATCH] Revert "elf: Relax MIPS' elf_check_arch() to accept
 EM_NANOMIPS too"
Content-Language: en-US
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
To: Vince Del Vecchio <Vince.DelVecchio@mediatek.com>,
 "qemu-devel@nongnu.org" <qemu-devel@nongnu.org>
References: <20211101114800.2692157-1-f4bug@amsat.org>
 <PSAPR03MB527055869102C6798B291CEBE28A9@PSAPR03MB5270.apcprd03.prod.outlook.com>
 <78b6efd1-9fc5-6bed-19bd-14a882e5db04@amsat.org>
In-Reply-To: <78b6efd1-9fc5-6bed-19bd-14a882e5db04@amsat.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42d;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wr1-x42d.google.com
X-Spam_score_int: -39
X-Spam_score: -4.0
X-Spam_bar: ----
X-Spam_report: (-4.0 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.249,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.249, NICE_REPLY_A=-2.549,
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
Cc: Aleksandar Rikalo <aleksandar.rikalo@syrmia.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Laurent Vivier <laurent@vivier.eu>, Aurelien Jarno <aurelien@aurel32.net>,
 Petar Jovanovic <petar.jovanovic@syrmia.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 11/1/21 23:04, Philippe Mathieu-Daudé wrote:
> On 11/1/21 22:40, Vince Del Vecchio wrote:
>> Philippe said:
>>
>>> So far QEMU only support the MIPS o32 / n32 / n64 ABIs. The p32 ABI is not implemented, therefore we can not run any nanoMIPS binary.
>>
>> We use it internally to run nanoMIPS binaries every day.  I had thought everything relevant was completed and upstreamed, but perhaps there is a gap somewhere.  Let us investigate a little and get back to you.
> 
> I could wait few days until QEMU hard freeze and queue this patch as a
> bug fix, but I doubt there is much you can do in that time frame, since
> tomorrow is the soft freeze deadline.
> 
> Here I am simply changing the code to reject p32 binaries to avoid
> users to waste their time trying to run a nanoMIPS binary. I am not
> removing any of the nanoMIPS emulation code.

Patch queued to mips-next.

