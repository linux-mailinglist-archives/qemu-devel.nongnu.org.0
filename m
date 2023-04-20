Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 49E126E8DD4
	for <lists+qemu-devel@lfdr.de>; Thu, 20 Apr 2023 11:21:21 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1ppQTN-0007tZ-D7; Thu, 20 Apr 2023 05:21:01 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1ppQTL-0007tQ-Qo
 for qemu-devel@nongnu.org; Thu, 20 Apr 2023 05:20:59 -0400
Received: from mail-ed1-x534.google.com ([2a00:1450:4864:20::534])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1ppQTK-0006x2-BB
 for qemu-devel@nongnu.org; Thu, 20 Apr 2023 05:20:59 -0400
Received: by mail-ed1-x534.google.com with SMTP id
 4fb4d7f45d1cf-5066ce4f725so641866a12.1
 for <qemu-devel@nongnu.org>; Thu, 20 Apr 2023 02:20:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1681982457; x=1684574457;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=ILvWa1prFY9moNVU56sT043chSWZBFwuqEU93dqzUEU=;
 b=Yyu11v/WIMIm/V1f4MkXLv0w4qqhBjRzqdLxaxY2B3L4770xJT98SuNPQEWo3Jfyks
 fzCF/h4CqtiPbgQpIdQ/UZgxqLUjp64irWXLUhQfUDIYFziKWfA8Af1S0pjYy8VxtPWD
 vN1oVuC2WrVhwhJbFQvHvgzJvQxTBx6s5TGcltWvNzlxGRrz4Pnd5jqmZAL1TIW0pTrp
 usV3pj0xoQuut3T59Oj4SlVcOUXWckIKa014/iTgaJnwANcKr7wd/u94erTXCXFsug0K
 UQ/uK9llYKbBWx2rsWUAZS7wME5RxlfBiq2kBbX/34knE5Fzyljwa0cYSPNOcP5lEJWq
 +SDQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1681982457; x=1684574457;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=ILvWa1prFY9moNVU56sT043chSWZBFwuqEU93dqzUEU=;
 b=dI41lz0XwBpH+QxhTNEbZhBbPA5+uRn/XtvQqyqIzVxH3AXQ37AuLPliOYIrvtj4C/
 loHXVSP+MxbeUIPIOoOhL6LzKWJUNqJYgA9GhAqOLvNUZ/XY6vl4tYlVmbADc8waGGQJ
 RlbrppiBH5PxdsGk5v9BI63E3Qt827idhP1zuxb2eoOu3OzPW3pw4Psuf7UlimSYIapm
 JBxx/R7MqHhIVq5nQ/Dj4PrhRWjubLHBa4kmkb4R6v5NCit0rdrVDyTT3sKIu2NOTSu0
 J4V4j8rGgMlJpkxWNKxt4nCfP+jIRpvbHTexqoY2LQOJ57DwesfkotymMWH/J2gBW2cO
 ArOw==
X-Gm-Message-State: AAQBX9etkNjM8NpCRyWtP8TSZg5ZPfnAEhAHA1Lv6Vw43cDAaFNWP5QX
 rzWiDtPOjnXRAnT7waXaLFULuZFXxDXVYKCvt662bA==
X-Google-Smtp-Source: AKy350YHUP2PBP+Q2i1VOAcl8kbGqopQp5PfBCYSuN5LCt8Y7UESis9ru+rvOtWDhK5l1MFI9cLf2+p62EcnmzIQ+dc=
X-Received: by 2002:a50:8757:0:b0:506:737e:2aa8 with SMTP id
 23-20020a508757000000b00506737e2aa8mr434959edv.6.1681982456412; Thu, 20 Apr
 2023 02:20:56 -0700 (PDT)
MIME-Version: 1.0
References: <20230419102940.185968-1-zhenzhong.duan@intel.com>
 <CAFEAcA_62h5U2jCOJq76pryCjVf3eV-Ovh6Cpwv8rXzNWd1H-w@mail.gmail.com>
 <SJ0PR11MB6744A176D93A71413397E06D92639@SJ0PR11MB6744.namprd11.prod.outlook.com>
In-Reply-To: <SJ0PR11MB6744A176D93A71413397E06D92639@SJ0PR11MB6744.namprd11.prod.outlook.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 20 Apr 2023 10:20:45 +0100
Message-ID: <CAFEAcA9hgwbXOoawQ3ABzqk_2m+p_ScmXh=9hRSgdsdRmb9tUA@mail.gmail.com>
Subject: Re: [PATCH v4] memory: Optimize replay of guest mapping
To: "Duan, Zhenzhong" <zhenzhong.duan@intel.com>
Cc: "qemu-devel@nongnu.org" <qemu-devel@nongnu.org>,
 "mst@redhat.com" <mst@redhat.com>, 
 "peterx@redhat.com" <peterx@redhat.com>,
 "jasowang@redhat.com" <jasowang@redhat.com>, 
 "marcel.apfelbaum@gmail.com" <marcel.apfelbaum@gmail.com>,
 "pbonzini@redhat.com" <pbonzini@redhat.com>, 
 "richard.henderson@linaro.org" <richard.henderson@linaro.org>,
 "eduardo@habkost.net" <eduardo@habkost.net>, 
 "david@redhat.com" <david@redhat.com>, "philmd@linaro.org" <philmd@linaro.org>,
 "Peng, Chao P" <chao.p.peng@intel.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::534;
 envelope-from=peter.maydell@linaro.org; helo=mail-ed1-x534.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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

On Thu, 20 Apr 2023 at 04:13, Duan, Zhenzhong <zhenzhong.duan@intel.com> wrote:
> >From: Peter Maydell <peter.maydell@linaro.org>

> >Question: is it OK for an implementation of this method to call the notifier for
> >translations that are in the IOMMU and which are not in the scope of the
> >notifier (ie which are outside the intersection) ? Or must it specifically restrict
> >itself to only calling the notifier for translations which are inside the notifier's
> >range ?
> In the calling path to notifier->notify(), memory_region_notify_iommu_one()
> ensures passing an IOMMUTLBEntry in the notifier's range.
> I think it's ok for an implementation of replay() to walk over the entire
> IOMMU MemoryRegion because unrelated entries are filtered as above.
> It's just less optimistic which this patch try to address for intel_iommu.

OK, great.

-- PMM

