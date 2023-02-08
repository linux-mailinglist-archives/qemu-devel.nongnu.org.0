Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6C95468E949
	for <lists+qemu-devel@lfdr.de>; Wed,  8 Feb 2023 08:47:05 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pPfA6-00067a-Ph; Wed, 08 Feb 2023 02:46:38 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pPf9b-00060H-Kg
 for qemu-devel@nongnu.org; Wed, 08 Feb 2023 02:46:10 -0500
Received: from mail-wr1-x436.google.com ([2a00:1450:4864:20::436])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pPf9U-0001Ag-9h
 for qemu-devel@nongnu.org; Wed, 08 Feb 2023 02:46:05 -0500
Received: by mail-wr1-x436.google.com with SMTP id m14so15782591wrg.13
 for <qemu-devel@nongnu.org>; Tue, 07 Feb 2023 23:45:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=IwAd/EadbU/3VrxY5KTRR2ocWA1dv38fzY46Pt05W64=;
 b=jD2UMDOP54i6PrSMXMjjMncgebrDNIANMYkBDq0RfP15mEGd1lFtcNqWlONnBFU0zR
 fV2qknoIEpIBTIJr9V3tEFE2ldTcoqP0u2RjUIv70sdfduspTplNu9clobnizeVmIM9L
 kpjf9gmJwnA5CAfaOgzdFj2FpmfSa4LXHgIZ6GmeELlEnc2JVJPUCWzerDT/9RJ4oyDC
 5Zbxg9bctSw9+4f1Z0ZGF/8zNPZO0Y6cn12kVGFA8eoTi3iZmZsEj4Uka2OMioXhdRYV
 NAcyNLIeb7F9ry/stOiYP/rk2sDuXjolipGanOEqDnAJr9DClipVNkFo0HKss3iczSd8
 qETw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=IwAd/EadbU/3VrxY5KTRR2ocWA1dv38fzY46Pt05W64=;
 b=MxCND5e5ltPIKGYaecPFwHD6CCDQgPFoZZx4mnvIGF49TFdLObcP0N4u1budEHIU89
 83cRTHb4I36gbUpQIhJSDBoaPcVbYj0YZFDci21kRjX4p315rz/HY466Q/QoKUMD8rE1
 8+h7QcBqhqE1NQ0UgZDPN3zGud7mmdaQdViA7UaVLONCGqfFv12dKxPTUtb/WGp2HaFv
 +FguJXTUaWbhXntdddBTv6niKD0CmihqJpovCtJOEtkWDWF5s4/CQr7cJmLNw6l4QDhj
 +bElv16Df+B0+O/cAja92Qrry0j4BFKhbP7Gukvamd7mz+06smNoPrInsPYdjZ2CP9+b
 E6OA==
X-Gm-Message-State: AO0yUKVc/pmTIeteMzyYht+VgcChaCz9ZDWCqefWQKq680xJdALVhuok
 v1+LqxU/cE0NvzLDKVTHyUnEpA==
X-Google-Smtp-Source: AK7set9v3WOltU9sH4/bnCcQ2oMxO5u4HODYYcfdUvpLMDXA/gkMuWGDDSCPxKLqsft5k6EzZMJGjA==
X-Received: by 2002:a5d:6e8b:0:b0:2bf:c753:573f with SMTP id
 k11-20020a5d6e8b000000b002bfc753573fmr5140207wrz.24.1675842357319; 
 Tue, 07 Feb 2023 23:45:57 -0800 (PST)
Received: from [192.168.30.216] ([81.0.6.76]) by smtp.gmail.com with ESMTPSA id
 q12-20020adff94c000000b002c405e19010sm85971wrr.11.2023.02.07.23.45.55
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 07 Feb 2023 23:45:56 -0800 (PST)
Message-ID: <1e078434-bd53-9f27-3b66-5ca9215fad05@linaro.org>
Date: Wed, 8 Feb 2023 08:45:54 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.6.1
Subject: Re: [PATCH 2/3] hw/ssi: Add Nuvoton PSPI Module
Content-Language: en-US
To: Hao Wu <wuhaotsh@google.com>
Cc: peter.maydell@linaro.org, qemu-arm@nongnu.org, qemu-devel@nongnu.org,
 venture@google.com, Avi.Fishman@nuvoton.com, kfting@nuvoton.com,
 hskinnemoen@google.com, titusr@google.com, Chris Rauer <crauer@google.com>
References: <20230206233428.2772669-1-wuhaotsh@google.com>
 <20230206233428.2772669-3-wuhaotsh@google.com>
 <de4b4eb1-0f77-fb20-5e8e-be751f4a32a5@linaro.org>
 <CAGcCb13Asc1GztkXEVwMPmh=7Ty1XGyeL9j=hO652uVYnyWNUg@mail.gmail.com>
 <CAGcCb12jxNqFW096UBcfs=aiQgEY5Jeo6=76wZu6-42wV8r2rQ@mail.gmail.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>
In-Reply-To: <CAGcCb12jxNqFW096UBcfs=aiQgEY5Jeo6=76wZu6-42wV8r2rQ@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::436;
 envelope-from=philmd@linaro.org; helo=mail-wr1-x436.google.com
X-Spam_score_int: -31
X-Spam_score: -3.2
X-Spam_bar: ---
X-Spam_report: (-3.2 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-1.148,
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
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

On 7/2/23 20:21, Hao Wu wrote:
> On Tue, Feb 7, 2023 at 10:46 AM Hao Wu <wuhaotsh@google.com 
> <mailto:wuhaotsh@google.com>> wrote:
> 
>     Thanks for your review!
> 
>     On Mon, Feb 6, 2023 at 11:13 PM Philippe Mathieu-Daudé
>     <philmd@linaro.org <mailto:philmd@linaro.org>> wrote:
> 
>         On 7/2/23 00:34, Hao Wu wrote:
>          > Nuvoton's PSPI is a general purpose SPI module which enables
>          > connections to SPI-based peripheral devices.
>          >
>          > Signed-off-by: Hao Wu <wuhaotsh@google.com
>         <mailto:wuhaotsh@google.com>>
>          > Reviewed-by: Chris Rauer <crauer@google.com
>         <mailto:crauer@google.com>>
>          > ---
>          >   MAINTAINERS                |   6 +-
>          >   hw/ssi/meson.build         |   2 +-
>          >   hw/ssi/npcm_pspi.c         | 216
>         +++++++++++++++++++++++++++++++++++++
>          >   hw/ssi/trace-events        |   5 +
>          >   include/hw/ssi/npcm_pspi.h |  53 +++++++++
>          >   5 files changed, 278 insertions(+), 4 deletions(-)
>          >   create mode 100644 hw/ssi/npcm_pspi.c
>          >   create mode 100644 include/hw/ssi/npcm_pspi.h


>          > +static void npcm_pspi_realize(DeviceState *dev, Error **errp)
>          > +{
>          > +    NPCMPSPIState *s = NPCM_PSPI(dev);
>          > +    SysBusDevice *sbd = SYS_BUS_DEVICE(dev);
>          > +    Object *obj = OBJECT(dev);
>          > +
>          > +    s->spi = ssi_create_bus(dev, "pspi");
> 
>         FYI there is an ongoing discussion about how to model QOM tree. If
>         this bus isn't shared with another controller, the "embed QOM child
>         in parent" style could be preferred. If so, the bus would be created
>         as:
> 
>                 object_initialize_child(obj, "pspi", &s->spi, TYPE_SSI_BUS);
> 
>     I was just following some existing code here. I think I can use the
>     new style. 
> 
> I've tried to use this and got the following error:
> **
> ERROR:../qom/object.c:511:object_initialize_with_type: assertion failed: 
> (size >= type->instance_size)
> Bail out! ERROR:../qom/object.c:511:object_initialize_with_type: 
> assertion failed: (size >= type->instance_size)
> 
> I think the problem is that we define s->spi as SSIBus* instead of 
> SSIBus. But if we define it as SSIBus, we'll
> get an incomplete type error. Fixing it will require refactoring 
> hw/ssi/ssi.c which I'm not sure if we want to do
> it right now. This code is consistent with other code in hw/ssi so I 
> guess we can leave it here for now and wait
> for a future refactor.
Sorry, I was just mumbling alone thinking about what would need to be
done, not asking you to change it yet :/ I should have been
more explicit.

