Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1B3516F5CF3
	for <lists+qemu-devel@lfdr.de>; Wed,  3 May 2023 19:21:50 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1puGAC-0005p0-0s; Wed, 03 May 2023 13:21:12 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1puGA8-0005c8-QR
 for qemu-devel@nongnu.org; Wed, 03 May 2023 13:21:08 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1puGA7-0004PP-AD
 for qemu-devel@nongnu.org; Wed, 03 May 2023 13:21:08 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1683134466;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=t8uvV2Uu2IelEjxdK6H8gm5ulXz4XSf3QdDPNcJH23A=;
 b=Xxz0/N7Rw6m2EXWjq+ddlpO60q14OQCZfKo98xsNaZVteaXZifKhI0mfl6ola7l4m93szu
 h6NLyZ174C0Y6cEDbw2AIOa83lawue7fDRBbOPX2YqOAiPnJG4XiG2BAtTcOHoVqdotFGI
 fIOHoEvtUwrdeL24rFDYi7EsAGW5OeM=
Received: from mail-ed1-f69.google.com (mail-ed1-f69.google.com
 [209.85.208.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-122-TUGYp7TSMSysnrjp35DOLA-1; Wed, 03 May 2023 13:21:02 -0400
X-MC-Unique: TUGYp7TSMSysnrjp35DOLA-1
Received: by mail-ed1-f69.google.com with SMTP id
 4fb4d7f45d1cf-50bc95a5051so4099347a12.1
 for <qemu-devel@nongnu.org>; Wed, 03 May 2023 10:21:02 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1683134461; x=1685726461;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=t8uvV2Uu2IelEjxdK6H8gm5ulXz4XSf3QdDPNcJH23A=;
 b=Oxi66Y6NQSu3HE1kU541Iizt8IK5WcxcebnJQ7vHBk42D5Z8i40FeOMxrDHPvsDsln
 tut8vuzJquY06XYt20lWgzz6tD/nH5X6A5RlFYehFUxeVRjsSFSodDqZxdaDvxcgt3qV
 zQoUmPTWnBs2dWCZy3D+U221dgmOiB6gaOgE0VKtwfOmjYvEn3UWIBeaqZURZ9oUPDEw
 Ijc7iQQTJGdpr2ru8CjENrKc7rj0El53jevWkdbhHp+0e70cHulp0cIqtV42Hrus7717
 MsX9XKmd//4GjWBPxCa86QuLICn8Uk4j2/fWO2pd5WcJbNUXvjzDUn5v8rHdmMS43CfT
 25vw==
X-Gm-Message-State: AC+VfDx0iJwJdh3I3iPOlu1pUdXhLcZjc1jeTLoSWOOlz/0onz05pnSs
 nf9wdYreyz5Md1HgXmm4iFQ3vTohtYjkNXARm75XPYDMRtAb2B5HNk7a0r7XtgdwFivv9WAZ5fB
 COjBd3AAJxTPwat0=
X-Received: by 2002:a17:906:dac5:b0:965:6603:34fa with SMTP id
 xi5-20020a170906dac500b00965660334famr2055403ejb.12.1683134461567; 
 Wed, 03 May 2023 10:21:01 -0700 (PDT)
X-Google-Smtp-Source: ACHHUZ4qQ/5u219Dh45BzfMIcoU3HpwoYJ/bhL2K/lQ4ppLnSiHNauvU8Tu51sCnaCWOawdEbohg1A==
X-Received: by 2002:a17:906:dac5:b0:965:6603:34fa with SMTP id
 xi5-20020a170906dac500b00965660334famr2055362ejb.12.1683134461232; 
 Wed, 03 May 2023 10:21:01 -0700 (PDT)
Received: from ?IPV6:2001:b07:6468:f312:9af8:e5f5:7516:fa89?
 ([2001:b07:6468:f312:9af8:e5f5:7516:fa89])
 by smtp.googlemail.com with ESMTPSA id
 mm26-20020a170906cc5a00b00961828830d9sm4398573ejb.35.2023.05.03.10.20.59
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 03 May 2023 10:21:00 -0700 (PDT)
Message-ID: <34f3732b-1452-b75a-1358-ba2a15d9ba87@redhat.com>
Date: Wed, 3 May 2023 19:20:58 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.9.1
Subject: Re: [PATCH 17/22] hw/xtensa: add VIRTIO as dependencies for
 XTENSA_VIRT
Content-Language: en-US
To: =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>,
 qemu-devel@nongnu.org
Cc: Laurent Vivier <lvivier@redhat.com>,
 Artyom Tarasenko <atar4qemu@gmail.com>,
 "Edgar E. Iglesias" <edgar.iglesias@gmail.com>,
 Wainer dos Santos Moschetta <wainersm@redhat.com>,
 Thomas Huth <thuth@redhat.com>, Leif Lindholm <quic_llindhol@quicinc.com>,
 Gerd Hoffmann <kraxel@redhat.com>, Helge Deller <deller@gmx.de>,
 Xiaojuan Yang <yangxiaojuan@loongson.cn>,
 Stefan Hajnoczi <stefanha@redhat.com>, Cleber Rosa <crosa@redhat.com>,
 Peter Maydell <peter.maydell@linaro.org>,
 Eduardo Habkost <eduardo@habkost.net>, Juan Quintela <quintela@redhat.com>,
 John Snow <jsnow@redhat.com>, Yoshinori Sato <ysato@users.sourceforge.jp>,
 =?UTF-8?Q?C=c3=a9dric_Le_Goater?= <clg@kaod.org>,
 Ilya Leoshkevich <iii@linux.ibm.com>,
 Pavel Dovgalyuk <pavel.dovgaluk@ispras.ru>, Andrew Jeffery
 <andrew@aj.id.au>, qemu-s390x@nongnu.org,
 Richard Henderson <richard.henderson@linaro.org>, qemu-arm@nongnu.org,
 Bastian Koppelmann <kbastian@mail.uni-paderborn.de>,
 Beraldo Leal <bleal@redhat.com>, Max Filippov <jcmvbkbc@gmail.com>,
 =?UTF-8?Q?Marc-Andr=c3=a9_Lureau?= <marcandre.lureau@redhat.com>,
 Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>,
 Jiaxun Yang <jiaxun.yang@flygoat.com>, Radoslaw Biernacki
 <rad@semihalf.com>, Aurelien Jarno <aurelien@aurel32.net>,
 David Hildenbrand <david@redhat.com>, Markus Armbruster <armbru@redhat.com>,
 Song Gao <gaosong@loongson.cn>, Joel Stanley <joel@jms.id.au>,
 =?UTF-8?Q?Daniel_P=2e_Berrang=c3=a9?= <berrange@redhat.com>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>
References: <20230503091244.1450613-1-alex.bennee@linaro.org>
 <20230503091244.1450613-18-alex.bennee@linaro.org>
From: Paolo Bonzini <pbonzini@redhat.com>
In-Reply-To: <20230503091244.1450613-18-alex.bennee@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=pbonzini@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -65
X-Spam_score: -6.6
X-Spam_bar: ------
X-Spam_report: (-6.6 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.161,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-4.28, RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=unavailable autolearn_force=no
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
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

On 5/3/23 11:12, Alex Bennée wrote:
> These are needed for board creation so fail under "make check" with a
> --without-default-devices build.
> 
> Signed-off-by: Alex Bennée<alex.bennee@linaro.org>
> ---
>   hw/xtensa/Kconfig | 2 ++
>   1 file changed, 2 insertions(+)
> 
> diff --git a/hw/xtensa/Kconfig b/hw/xtensa/Kconfig
> index 0740657ea5..a54a9d395e 100644
> --- a/hw/xtensa/Kconfig
> +++ b/hw/xtensa/Kconfig
> @@ -6,6 +6,8 @@ config XTENSA_VIRT
>       select XTENSA_SIM
>       select PCI_EXPRESS_GENERIC_BRIDGE
>       select PCI_DEVICES
> +    select VIRTIO_PCI
> +    select VIRTIO_NET

Not needed.

Paolo


