Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7D6825A9B43
	for <lists+qemu-devel@lfdr.de>; Thu,  1 Sep 2022 17:09:34 +0200 (CEST)
Received: from localhost ([::1]:38822 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oTloz-0004A2-K0
	for lists+qemu-devel@lfdr.de; Thu, 01 Sep 2022 11:09:33 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:43330)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jean-philippe@linaro.org>)
 id 1oTlfm-0003wK-Og
 for qemu-devel@nongnu.org; Thu, 01 Sep 2022 11:00:02 -0400
Received: from mail-wr1-x434.google.com ([2a00:1450:4864:20::434]:36508)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <jean-philippe@linaro.org>)
 id 1oTlfk-0003Fp-1j
 for qemu-devel@nongnu.org; Thu, 01 Sep 2022 11:00:02 -0400
Received: by mail-wr1-x434.google.com with SMTP id u17so3469801wrp.3
 for <qemu-devel@nongnu.org>; Thu, 01 Sep 2022 07:59:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc;
 bh=g+pf+qp46Ey6IRDWCznSNjxBcysXDKvdrVAdcHjC9ak=;
 b=GQD1O68x7Tk8TQ0nldf8uyNctsMSMywFlLvoLjerqwpxiXCebmtoBVn+nlgHsbknO2
 up0wFgs17PQsbIU4RsPKXbnWMxdJxs3TgFn8PCyFPapvg+JW+VPA/q7I8FZoe59nRs48
 2ATDjEgULgQwtGn6zqVjywOHG9gEJZtjE3EW2Up7/p/rYepE4SSnGsmUE4OHA14EmckB
 hGWMsIvxJZugF3a/d/rYJRqJxNmYb5/CNVzlUBZOi7Q1FQzKEGPk2aCl7mWd+PjvBD3D
 FWWp7aRfCCVcOYZwB8jGbrQTiyRR8FlEBkxRI0dsmXOlns7YDxgPQwgalbQC3Q1vSGsf
 13LA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc;
 bh=g+pf+qp46Ey6IRDWCznSNjxBcysXDKvdrVAdcHjC9ak=;
 b=fSUBotE5lRoXGOzi45LQUUeLp/eAYOn17igimc/CzHYEQbNyYUwwHgSpU8GYdZZFvw
 ytbhUk3lMpayMxZ9/s97bMMVVINiLftx/NFwrrm8mg9lJvu3FQQSq4Kc0qAX1YbzOQCD
 qtuPYXL/v5a1+EEJj2rWD1mbKNlqUlraH0iaH5Q0Yg8ajfy8Vtr4xG2B+gzOexE+dm/d
 vz4bDWk9NhvBM5xerY5jPIJkN4clgp0a4BMPeY/9NNdRX7xQcqpygL9k0t/4FVCkS+ho
 LXGhclr39LNPMPNbpnfwfvqBhyG6eRHkbNsU+reSzmlfeHOUp3GiH3GZqGhTaEtjWQXN
 lujg==
X-Gm-Message-State: ACgBeo3QpW+Hg+Hh1+u9m+PyKREBY9Wxp8lb2Yp/9+qc6uTDbhwTS3f/
 +O20OJn7CiLQSQnDcfNuIz77bw==
X-Google-Smtp-Source: AA6agR4HtGCEFPkmgYeWgRqKc/a8fMqhy/vyNsaz8nsWZCSqjGKvTHT5zT4KGeOxCXsQyfWRS97eyw==
X-Received: by 2002:a05:6000:1805:b0:226:8c06:768e with SMTP id
 m5-20020a056000180500b002268c06768emr14713888wrh.646.1662044398551; 
 Thu, 01 Sep 2022 07:59:58 -0700 (PDT)
Received: from myrica (cpc92880-cmbg19-2-0-cust679.5-4.cable.virginm.net.
 [82.27.106.168]) by smtp.gmail.com with ESMTPSA id
 h4-20020a05600c350400b003a54f49c1c8sm7704858wmq.12.2022.09.01.07.59.57
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 01 Sep 2022 07:59:58 -0700 (PDT)
Date: Thu, 1 Sep 2022 15:59:55 +0100
From: Jean-Philippe Brucker <jean-philippe@linaro.org>
To: Peter Maydell <peter.maydell@linaro.org>
Cc: qemu-arm@nongnu.org, qemu-devel@nongnu.org, robh+dt@kernel.org,
 eauger@redhat.com
Subject: Re: [PATCH 08/10] hw/arm/virt: Fix devicetree warnings about the
 GPIO node
Message-ID: <YxDI67Pwc6AMNKXm@myrica>
References: <20220824155113.286730-1-jean-philippe@linaro.org>
 <20220824155113.286730-9-jean-philippe@linaro.org>
 <CAFEAcA-8wCHuj6tZN0VB1boaOy50TtwpyUMziFgk2G4++Ay16A@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAFEAcA-8wCHuj6tZN0VB1boaOy50TtwpyUMziFgk2G4++Ay16A@mail.gmail.com>
Received-SPF: pass client-ip=2a00:1450:4864:20::434;
 envelope-from=jean-philippe@linaro.org; helo=mail-wr1-x434.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Wed, Aug 24, 2022 at 08:48:26PM +0100, Peter Maydell wrote:
> On Wed, 24 Aug 2022 at 16:51, Jean-Philippe Brucker
> <jean-philippe@linaro.org> wrote:
> >
> > The GPIO devicetree node is missing "interrupt-controller" and
> > "#interrupt-cells" properties:
> >
> >   pl061@9030000: 'interrupt-controller' is a required property
> >   From schema: linux/Documentation/devicetree/bindings/gpio/pl061-gpio.yaml
> >   pl061@9030000: '#interrupt-cells' is a required property
> >   From schema: linux/Documentation/devicetree/bindings/gpio/pl061-gpio.yaml
> 
> Why? This is a GPIO controller, not an interrupt controller.
> It seems wrong to be advertising in the dtb that it is.

pl061 can be used as an interrupt controller, and I think it's wired that
way, with GPIO key acting as an interrupt source. I'll add this to the
commit message.

Thanks,
Jean

