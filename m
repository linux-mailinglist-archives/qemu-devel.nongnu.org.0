Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id BC3ED69C7FC
	for <lists+qemu-devel@lfdr.de>; Mon, 20 Feb 2023 10:52:44 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pU2qY-00072U-6D; Mon, 20 Feb 2023 04:52:34 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pU2qW-000726-AB
 for qemu-devel@nongnu.org; Mon, 20 Feb 2023 04:52:32 -0500
Received: from mail-wr1-x42e.google.com ([2a00:1450:4864:20::42e])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pU2qU-0005Nx-Ex
 for qemu-devel@nongnu.org; Mon, 20 Feb 2023 04:52:31 -0500
Received: by mail-wr1-x42e.google.com with SMTP id 6so54449wrb.11
 for <qemu-devel@nongnu.org>; Mon, 20 Feb 2023 01:52:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=BBt3SQ9mw98YuY/+AJbV8Ns8AzoLe2hqu1O30UxIsa0=;
 b=Dc+gz92s2OMQqRHBwgB7VrceQT/w7mFAz8syeKpGgOLhM88TFZ3VBJifGSEPeqJ6de
 2UT33Xf8Z7BmgtXoaLcMJQiNtwvUaiGnbM5YLVo3pNpq3a8ycI8dEVguojtrFUmGCRF7
 dWazPfgELKEBXpUNVWKQKtCaMR+LHPI/7g2sdy508NziLBn2ikdwFh9s/cO3kFFxNlA2
 yXsXW4Q9nHvQzgoNyBNX3EPTmFVBLyQCnWkCq/mNpU+L73PCjwwKffFgtcxChQ/dscHV
 rUody4lTIytfiEVNZYZx1NxdiijF0VQ7cjglNcEMrdZThgAw8MSOG+Ei6qoZya3qWs8D
 LfjA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=BBt3SQ9mw98YuY/+AJbV8Ns8AzoLe2hqu1O30UxIsa0=;
 b=AmbiFZESzakEf0zG2YeFv0B1dow12tOxHx0EdeuqeJ/jrChI+Nx25mDO+1QhT7edH/
 P/6U0j02nfi8ICVqi+nO6HQO2OlNwlXaKysGYzwpduje0UcCv5MKjCNKRbgSBlabgcih
 DchM5aK7U2v/57jY+KTiRxLwvGEpWwIzPHkXXYi+5vmZPDjr5m3J0QwFWEsvxkAAJrwG
 CiqBhxy+6BhZXBz0hd4R1BBZzauRubISyPbAiyfFLtQgnZKrhI73GZFe/jy1Bl0YoG/3
 saodTrQ07qJLkc/vpG/rIQ5dWg5JdSfCF7LxEmK4SPbLHgsRKqY2AHqOF5WxvksWXAu+
 n5GQ==
X-Gm-Message-State: AO0yUKXHB/nx2Mkn/azKPanfXLUVhWpzrrYPHx8izSNc+GBf5ipiX8S8
 ZY8m8UNeHiEYtGZfk7LhhdfoyQ==
X-Google-Smtp-Source: AK7set9k09+1Ms53s62ra+Ds7AS0F5lGbSiGPuDe+mczZclZbR/8LVo24R2HTeuzzI8Mw5ZCqtuYeg==
X-Received: by 2002:adf:fb8f:0:b0:2c5:58fb:fa92 with SMTP id
 a15-20020adffb8f000000b002c558fbfa92mr766498wrr.7.1676886748909; 
 Mon, 20 Feb 2023 01:52:28 -0800 (PST)
Received: from [192.168.30.216] ([81.0.6.76]) by smtp.gmail.com with ESMTPSA id
 y16-20020a5d4710000000b002c553509db7sm5373540wrq.52.2023.02.20.01.52.27
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 20 Feb 2023 01:52:28 -0800 (PST)
Message-ID: <f6e24ede-2d91-5258-18e0-bf9ecf3afc18@linaro.org>
Date: Mon, 20 Feb 2023 10:52:27 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.8.0
Subject: Re: [PATCH v2 06.5/18] hw/ide/piix: Allow using PIIX3-IDE as
 standalone PCI function
Content-Language: en-US
To: Gerd Hoffmann <kraxel@redhat.com>, pbonzini@redhat.com
Cc: qemu-devel@nongnu.org, qemu-ppc@nongnu.org, hreitz@redhat.com,
 kwolf@redhat.com, mst@redhat.com, qemu-block@nongnu.org,
 hpoussin@reactos.org, richard.henderson@linaro.org, eduardo@habkost.net,
 John Snow <jsnow@redhat.com>, Bernhard Beschow <shentey@gmail.com>,
 "reviewer:Incompatible changes" <libvir-list@redhat.com>,
 Peter Maydell <peter.maydell@linaro.org>,
 =?UTF-8?Q?Daniel_P=2e_Berrang=c3=a9?= <berrange@redhat.com>
References: <20230215161641.32663-1-philmd@linaro.org>
 <20230220080044.4646-1-philmd@linaro.org>
 <20230220091008.tgg2pqockjsttbsm@sirius.home.kraxel.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>
In-Reply-To: <20230220091008.tgg2pqockjsttbsm@sirius.home.kraxel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42e;
 envelope-from=philmd@linaro.org; helo=mail-wr1-x42e.google.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.09,
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

On 20/2/23 10:10, Gerd Hoffmann wrote:
> On Mon, Feb 20, 2023 at 09:00:44AM +0100, Philippe Mathieu-Daudé wrote:
>> In order to allow Frankenstein uses such plugging a PIIX3
>> IDE function on a ICH9 chipset (which already exposes AHCI
>> ports...) as:
>>
>>    $ qemu-system-x86_64 -M q35 -device piix3-ide
>>
>> add a kludge to automatically wires the IDE IRQs on an ISA
>> bus exposed by a PCI-to-ISA bridge (usually function #0).
>> Restrict this kludge to the PIIX3.
> 
> Well.  On physical hardware you have a config switch in the bios
> setup which turns off sata and enables ide instead (i.e. the
> chipset implements both and can be configured to expose the one
> or the other).
> 
> If we want support ide for q35 we should IMHO do something simliar
> instead of making piix-ide user-pluggable.  We already have -machine
> q35,sata={on,off}.  We could extend that somehow, by adding
> ide={on,off}, or by using storage={sata,ide,off} instead.
> 
> This has been discussed now and then in the past and the usual
> conclusion was that there is little reason to implement that given
> that you can just use the 'pc' machine type.  For guests that old
> that they can't handle sata storage this is usually the better fit
> anyway ...

I think we might not using the same words, but agree on the goal :)

Since this has been discussed in the past, I suppose some users
want this config available. Why are they using this convoluted
config? Could it be due to lack of good documentation?

Do we really need a storage={sata,ide,off} flag? I don't see its
value. Help cloud users to have a sane config?

(old) boards exist with both IDE/SATA and we might want to emulate
some of them, but IMO such boards should be well modeled (Either
in C or later in declarative language) but not automagically created
from CLI.

IOW:

- using PIIX on Q35 (or any machine exposing a PCI bus) is
   acceptable, but the chipset should be instantiated as a whole.
   So to be clear I'm not against "-M q35 -device piix3", we should
   keep that working.

- we shouldn't try to maintain such Frankenstein corner cases which
   force us to add complex hacks, hard to remove, which limit us
   in implementing new features and cost us a lot of maintenance /
   testing time.

So I propose we deprecate this config so we can keep going forward.

(More generally I'd like to not allow instantiating part of chipset).

