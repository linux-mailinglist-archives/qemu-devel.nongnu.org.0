Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8F8285A9B01
	for <lists+qemu-devel@lfdr.de>; Thu,  1 Sep 2022 16:58:37 +0200 (CEST)
Received: from localhost ([::1]:43078 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oTleO-0001K0-LS
	for lists+qemu-devel@lfdr.de; Thu, 01 Sep 2022 10:58:36 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:46872)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jean-philippe@linaro.org>)
 id 1oTlbE-0004Ic-JA
 for qemu-devel@nongnu.org; Thu, 01 Sep 2022 10:55:20 -0400
Received: from mail-wm1-x336.google.com ([2a00:1450:4864:20::336]:42938)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <jean-philippe@linaro.org>)
 id 1oTlbB-0002TZ-NH
 for qemu-devel@nongnu.org; Thu, 01 Sep 2022 10:55:19 -0400
Received: by mail-wm1-x336.google.com with SMTP id
 d12-20020a05600c34cc00b003a83d20812fso1634660wmq.1
 for <qemu-devel@nongnu.org>; Thu, 01 Sep 2022 07:55:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc;
 bh=5uqJA5bkdeIRNpbJqifZuVvgLe4a26sOSkLM0qolaoo=;
 b=F6L+83M4BbJnz3IN9L54sNPL09/lnlxbOrE43DdZvTuK9rfgZMsTxnQXTAyTJ7CLY1
 +ooPaqnxqe8oBN9q0KULeZB/7FRMVpr4XIJrqnRIX939HrbAWHXYVYUIzpaJV0br1ZdQ
 QGTucSkK2rfja0ljjWvTurNVByfYeXZKwq/MBJ/qVK7UjKEuKfVbD86Mc0YtMuc15XrC
 +Vve6zEOmKWLHxmMSZb5ueefl/o690vTIDP/ZUYSqKw3uCPnPCwLNw1a9JFCCN4dHmTA
 7eb1ZNDzTsR4ZaBMM6w0DuuB4QStwBKD3YvDcXskszZp1vBX3/1YOCdySZjqO6xgXM3P
 Zg9Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc;
 bh=5uqJA5bkdeIRNpbJqifZuVvgLe4a26sOSkLM0qolaoo=;
 b=YbYPY7SB3Dz2GFOvAd4VYC3JBtKEiG6CeMVHdtqqFLjGpLVA6RJ8iHmKII2tEdtOt2
 eiZFmBNlIvwXRUCouyhHlhf1ULwxhlvt99lX3cyGPL+qkb7s/tixhvkJlBG9oGkF+DAY
 Qs2OeRAcKVzxFKEZlw0RbLUDoTW768WZ4R/w44cswCaIQ4XKHQpj7+80k0BvQujBFVBx
 mryOIUCCPqfpbRdQy10HStWBlMYDu1vijalbMr3ozn3jV23/ygFMaBohW8nJZAj7Ci/X
 oVxujOiRw0SBuxw1J0/pCS5S8cXWhnTQL6CkKKmyNdyOiXoM358veDY0y2VOm8wra62j
 URcA==
X-Gm-Message-State: ACgBeo2jpo/FT8kYA7Ag9SzspmiPgwjRyr2qVLr0rW/tGLvkxvKpamf6
 Sr72XDcLuHPXr06YDb2CXlpKTdwXspq4t6Qa
X-Google-Smtp-Source: AA6agR6TAIs8HHccT/FRrKuzblSuRO8qJkZ6jVF5gKICknwB82HQQ/cfBItzVhBxJKAX8ovQYdoHKA==
X-Received: by 2002:a05:600c:3790:b0:3a5:435d:b2d3 with SMTP id
 o16-20020a05600c379000b003a5435db2d3mr5622929wmr.134.1662044116140; 
 Thu, 01 Sep 2022 07:55:16 -0700 (PDT)
Received: from myrica (cpc92880-cmbg19-2-0-cust679.5-4.cable.virginm.net.
 [82.27.106.168]) by smtp.gmail.com with ESMTPSA id
 d14-20020a05600c34ce00b003a5f54e3bbbsm5756577wmq.38.2022.09.01.07.55.15
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 01 Sep 2022 07:55:15 -0700 (PDT)
Date: Thu, 1 Sep 2022 15:55:13 +0100
From: Jean-Philippe Brucker <jean-philippe@linaro.org>
To: Peter Maydell <peter.maydell@linaro.org>
Cc: qemu-arm@nongnu.org, qemu-devel@nongnu.org, robh+dt@kernel.org,
 eauger@redhat.com
Subject: Re: [PATCH 03/10] hw/arm/virt: Fix devicetree warnings about the GIC
 node
Message-ID: <YxDH0b9xCrrHGh/5@myrica>
References: <20220824155113.286730-1-jean-philippe@linaro.org>
 <20220824155113.286730-4-jean-philippe@linaro.org>
 <CAFEAcA-mnwzLChUp3_DP0Wz+et9sbv5mMowZn_tf7PPSkfWuSQ@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAFEAcA-mnwzLChUp3_DP0Wz+et9sbv5mMowZn_tf7PPSkfWuSQ@mail.gmail.com>
Received-SPF: pass client-ip=2a00:1450:4864:20::336;
 envelope-from=jean-philippe@linaro.org; helo=mail-wm1-x336.google.com
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

On Wed, Aug 24, 2022 at 08:36:33PM +0100, Peter Maydell wrote:
> On Wed, 24 Aug 2022 at 16:51, Jean-Philippe Brucker
> <jean-philippe@linaro.org> wrote:
> >
> > Fix three dt-validate warnings about the GIC node due to invalid names
> > and missing property:
> >
> >   intc@8000000: $nodename:0: 'intc@8000000' does not match '^interrupt-controller(@[0-9a-f,]+)*$'
> >   intc@8000000: 'its@8080000' does not match any of the regexes: '^(msi-controller|gic-its|interrupt-controller)@[0-9a-f]+$', '^gic-its@', '^interrupt-controller@[0-9a-f]+$', 'pinctrl-[0-9]+'
> >
> >   interrupt-controller@8000000: msi-controller@8080000: '#msi-cells' is a required property
> >   From schema: linux/Documentation/devicetree/bindings/interrupt-controller/arm,gic-v3.yaml
> 
> Why is dt-validate complaining about the node names? Surely
> anything looking for the ITS in the DT should be looking for
> it by the "compatible" string ?

The device-tree specification, in 2.2.2 Generic Name Recommendation [1],
provides the node names. Given that the guest will look at compatible
strings, changing the name is safe.

Thanks,
Jean

[1] http://devicetree-org.github.io/devicetree-specification/index.html#generic-names-recommendation 

