Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3EC144C5E4D
	for <lists+qemu-devel@lfdr.de>; Sun, 27 Feb 2022 19:53:24 +0100 (CET)
Received: from localhost ([::1]:55058 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nOOfY-0000OO-7V
	for lists+qemu-devel@lfdr.de; Sun, 27 Feb 2022 13:53:20 -0500
Received: from eggs.gnu.org ([209.51.188.92]:38084)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1nOOaG-0005r2-6E; Sun, 27 Feb 2022 13:47:52 -0500
Received: from [2607:f8b0:4864:20::1029] (port=44692
 helo=mail-pj1-x1029.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1nOOaE-00089L-C8; Sun, 27 Feb 2022 13:47:51 -0500
Received: by mail-pj1-x1029.google.com with SMTP id
 cp23-20020a17090afb9700b001bbfe0fbe94so9405814pjb.3; 
 Sun, 27 Feb 2022 10:47:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:in-reply-to:content-transfer-encoding;
 bh=OY3pfGWUsLZBu/ETt+n7ibzfe4YwlbmuZ4OlQ6KUiNo=;
 b=TlQecfmVe1+eeE8ORifZZuvB1A4uKk2ZclNe2INRq26XXZqRPVuwUOhWS/H0Qy++FZ
 Wkc/QuV24s+bysk/l9aL2VGsBGVztqUflv5AsqvUoKysFiWCi6BgachvrYJxdqhfxw6b
 OZRNJIAEUoU5wfChY0xgsJ7y9imYfPanMsDg3U+yJSjSf4jaE4HmmOFBHjDnPhPdjfL9
 DE23+SLD37WGoAexvx2jldPsMkAB6kXEJcEnWITxXSlazM6H2HKr8t2WtLwEt7qe+wHJ
 moTQuzDXgtbc3xcQTBDWZojLi0cdN+j/B6LOHG5lwplHxjvkzLYxQqqyBtbhDxPD2Qq0
 SEgA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=OY3pfGWUsLZBu/ETt+n7ibzfe4YwlbmuZ4OlQ6KUiNo=;
 b=G8zz4ReR+HKrd1umSIy0UPKVNXODyBSpEfK+l/aOhz4qDmqD+D+3Ma3wdx3kyn5o1K
 1EzVf4mFb/+EWtEceg40fa2iboatbIjoCmA1UH0dmu5BTDDHOza+V1e8SjVpcY2k9yvO
 fOI26iFGaTnuL0956GyrgsCqp9yH1FezNnOJtvYmeWACpbLYf/Szbg7LH4qCP+GoMXRM
 vhpo0+nv800obc5QR6qMi5yWKAjKgKvGej4TnvpYzVbpXyxWogO+g1rIzLv3oIJ3WiHg
 lDq0XINIYrfns/Y8W/nzqZSdaw6Vdnrl1hJ1WTDpHTOcvBUQ/f8pGmkctIu1f9P9zNVa
 LsRQ==
X-Gm-Message-State: AOAM5338l6on7lLOq5Sd9WBM4kGzKwYEWOsd3BJged7xk0MY/U4rJfAM
 Gv71fwbQApDKGuVPTS3NB0k=
X-Google-Smtp-Source: ABdhPJxCkMIGGOts1Pdm1oYByYn9N9VfJoWODhxqEwujtpTdFKQwsiPrNfHW7WWrwmhA3/3drhEteA==
X-Received: by 2002:a17:902:c1c4:b0:14f:b5fa:f945 with SMTP id
 c4-20020a170902c1c400b0014fb5faf945mr17283993plc.169.1645987667289; 
 Sun, 27 Feb 2022 10:47:47 -0800 (PST)
Received: from [192.168.1.115] (32.red-88-28-25.dynamicip.rima-tde.net.
 [88.28.25.32]) by smtp.gmail.com with ESMTPSA id
 h22-20020a056a00231600b004e1784925e5sm10565165pfh.97.2022.02.27.10.47.35
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 27 Feb 2022 10:47:46 -0800 (PST)
Message-ID: <aa0e1eb4-ef43-b386-e7a3-c034f666181b@gmail.com>
Date: Sun, 27 Feb 2022 19:47:31 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:91.0)
 Gecko/20100101 Thunderbird/91.6.1
Subject: Re: [PATCH 5/9] tests/avocado/linux_ssh_mips_malta.py: add missing
 accel (tcg) tag
Content-Language: en-US
To: Cleber Rosa <crosa@redhat.com>, qemu-devel@nongnu.org,
 =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>,
 =?UTF-8?Q?Daniel_P_=2e_Berrang=c3=a9?= <berrange@redhat.com>,
 Peter Maydell <peter.maydell@linaro.org>
References: <20220225210156.2032055-1-crosa@redhat.com>
 <20220225210156.2032055-6-crosa@redhat.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?=
 <philippe.mathieu.daude@gmail.com>
In-Reply-To: <20220225210156.2032055-6-crosa@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::1029
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::1029;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-pj1-x1029.google.com
X-Spam_score_int: -6
X-Spam_score: -0.7
X-Spam_bar: /
X-Spam_report: (-0.7 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 NICE_REPLY_A=-0.001, PDS_HP_HELO_NORDNS=0.659, RCVD_IN_DNSWL_NONE=-0.0001,
 RDNS_NONE=0.793, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=no autolearn_force=no
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
Cc: Huacai Chen <chenhuacai@kernel.org>,
 Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>,
 Eric Farman <farman@linux.ibm.com>,
 KONRAD Frederic <frederic.konrad@adacore.com>,
 "Edgar E. Iglesias" <edgar.iglesias@gmail.com>,
 Alexandre Iooss <erdnaxe@crans.org>,
 Yoshinori Sato <ysato@users.sourceforge.jp>,
 Daniel Henrique Barboza <danielhb413@gmail.com>,
 Wainer dos Santos Moschetta <wainersm@redhat.com>,
 Halil Pasic <pasic@linux.ibm.com>,
 =?UTF-8?Q?Herv=c3=a9_Poussineau?= <hpoussin@reactos.org>,
 Antony Pavlov <antonynpavlov@gmail.com>,
 Christian Borntraeger <borntraeger@linux.ibm.com>,
 Thomas Huth <thuth@redhat.com>, Greg Kurz <groug@kaod.org>,
 Fabien Chouteau <chouteau@adacore.com>, Eric Auger <eric.auger@redhat.com>,
 qemu-s390x@nongnu.org, qemu-arm@nongnu.org, Michael Rolnik <mrolnik@gmail.com>,
 =?UTF-8?Q?C=c3=a9dric_Le_Goater?= <clg@kaod.org>,
 Pavel Dovgalyuk <pavel.dovgaluk@ispras.ru>,
 David Gibson <david@gibson.dropbear.id.au>, Beraldo Leal <bleal@redhat.com>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>, qemu-ppc@nongnu.org,
 Paolo Bonzini <pbonzini@redhat.com>, Mahmoud Mandour <ma.mandourr@gmail.com>,
 Aurelien Jarno <aurelien@aurel32.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 25/2/22 22:01, Cleber Rosa wrote:
> Being explicit about the accelerator used on these tests is a good
> thing in itself, but it will also be used in the filtering rules
> applied on "make check-avocado".
> 
> Signed-off-by: Cleber Rosa <crosa@redhat.com>
> ---
>   tests/avocado/linux_ssh_mips_malta.py | 3 +++
>   1 file changed, 3 insertions(+)
> 
> diff --git a/tests/avocado/linux_ssh_mips_malta.py b/tests/avocado/linux_ssh_mips_malta.py
> index c0f0be5ade..0179d8a6ca 100644
> --- a/tests/avocado/linux_ssh_mips_malta.py
> +++ b/tests/avocado/linux_ssh_mips_malta.py
> @@ -23,6 +23,9 @@
>   @skipUnless(os.getenv('AVOCADO_TIMEOUT_EXPECTED'), 'Test might timeout')

Should we remove this line then? ^^^

>   @skipUnless(ssh.SSH_CLIENT_BINARY, 'No SSH client available')
>   class LinuxSSH(QemuSystemTest, LinuxSSHMixIn):
> +    """
> +    :avocado: tags=accel:tcg
> +    """
>   
>       timeout = 150 # Not for 'configure --enable-debug --enable-debug-tcg'
>   


