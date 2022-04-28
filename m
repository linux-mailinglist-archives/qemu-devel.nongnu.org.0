Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6614251352E
	for <lists+qemu-devel@lfdr.de>; Thu, 28 Apr 2022 15:32:18 +0200 (CEST)
Received: from localhost ([::1]:35976 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nk4Fk-0001mF-8O
	for lists+qemu-devel@lfdr.de; Thu, 28 Apr 2022 09:32:16 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:44330)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jean-philippe@linaro.org>)
 id 1nk4Cy-0000BF-PE
 for qemu-devel@nongnu.org; Thu, 28 Apr 2022 09:29:24 -0400
Received: from mail-wm1-x32f.google.com ([2a00:1450:4864:20::32f]:41788)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <jean-philippe@linaro.org>)
 id 1nk4Cx-0008GK-6F
 for qemu-devel@nongnu.org; Thu, 28 Apr 2022 09:29:24 -0400
Received: by mail-wm1-x32f.google.com with SMTP id
 u9-20020a05600c00c900b00393e729e655so3071562wmm.0
 for <qemu-devel@nongnu.org>; Thu, 28 Apr 2022 06:29:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=hkucPvIEbnY9uK5Y45ZSk4pCnQK1qWdY0gVf1+LKzoE=;
 b=M01QOoJVC3pAeBFyycH1viCjht1noU8S4Xj2TUyTE3RrX20ahhKUvb/FL4HpuZaiY2
 InrYZ47bHHhiUcr9szibgYrlMNEZbkPbXAMFCu1mY7sZeBcp6CXlVSfurPcdobI1etOr
 nA9e5v6Fz8rwL13teb7kOlSOGMSGoVug0kwvcTqx9jtlaN+n7hrNrjWrmqOZIFV5fN9r
 XOaq+NAiYZsX23rDftCaRSuxAz3YYHZlRcQOKPlWCUyF0cs62DFhuL1dYA9Vh/UWEAP/
 UA30zzG9TxOMiPpj13M18M9GxqF0hsx/eHRePKQUggF8IjzMdY4nEj+x/soxCBUdsfRo
 m/FA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=hkucPvIEbnY9uK5Y45ZSk4pCnQK1qWdY0gVf1+LKzoE=;
 b=7SdRumayPTB+7wVdrCzZn9JvKuOvRxbYcYs5WLILu71Ph/BL2yi9VtEWRPMeKxqpTW
 UD6szxFTNnbnl5Ctx2ILG679CRGQCycsEqZyzgSz+o4NjS+HNOH6JWwVbJLdeaWiPvtX
 4JrvyCYY2eIWgKvXItCNBBtAg05YrDsMcrOvbAGYXV+QMUj0KnQjUeqNGxc9JA7aZXF2
 74Y4gyPWEmZoO8DV+SkJPCswU01IG6XgH4AGKtASl2cL4AyMYKyuSFQoBJVjEP95HGmu
 nGU+uN31DRNdg+linCkRHg6/5Pz588n2+CXdzZdNKgv+pyOZEF3+LqSMWGYnfgD+/+L6
 HqLQ==
X-Gm-Message-State: AOAM531Oujtomq+qD05NT81RyKKSQU0oWCNwLvK6+tjFb1Py3lgkf1xw
 3lBAoZmIlEE+qPfSaZAIgHnTGw==
X-Google-Smtp-Source: ABdhPJyY8xotHNvVUCCFrWSarUWO1rlL7L8e8Bz1H2cZiQ8ZSpPlIckc3gbbMDdPPrUrEFY6SGG1MA==
X-Received: by 2002:a05:600c:3493:b0:38e:bbbb:26f7 with SMTP id
 a19-20020a05600c349300b0038ebbbb26f7mr30884601wmq.114.1651152560881; 
 Thu, 28 Apr 2022 06:29:20 -0700 (PDT)
Received: from myrica (cpc92880-cmbg19-2-0-cust679.5-4.cable.virginm.net.
 [82.27.106.168]) by smtp.gmail.com with ESMTPSA id
 j13-20020a05600c190d00b00393ee555683sm5359045wmq.27.2022.04.28.06.29.19
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 28 Apr 2022 06:29:20 -0700 (PDT)
Date: Thu, 28 Apr 2022 14:28:55 +0100
From: Jean-Philippe Brucker <jean-philippe@linaro.org>
To: Peter Maydell <peter.maydell@linaro.org>
Subject: Re: [PATCH 1/2] hw/arm/smmuv3: Cache event fault record
Message-ID: <YmqWl9M1NXn1Qdy2@myrica>
References: <20220427111543.124620-1-jean-philippe@linaro.org>
 <CAFEAcA-ipGkitCW_5oFeuzj1e1LYOKvU-MoU8xJgdXx1bfta3w@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAFEAcA-ipGkitCW_5oFeuzj1e1LYOKvU-MoU8xJgdXx1bfta3w@mail.gmail.com>
Received-SPF: pass client-ip=2a00:1450:4864:20::32f;
 envelope-from=jean-philippe@linaro.org; helo=mail-wm1-x32f.google.com
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
Cc: eric.auger@redhat.com, qemu-arm@nongnu.org, qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Thu, Apr 28, 2022 at 01:58:50PM +0100, Peter Maydell wrote:
> On Wed, 27 Apr 2022 at 12:17, Jean-Philippe Brucker
> <jean-philippe@linaro.org> wrote:
> >
> > The Record bit in the Context Descriptor tells the SMMU to report fault
> > events to the event queue. Since we don't cache the Record bit at the
> > moment, access faults from a cached Context Descriptor are never
> > reported. Store the Record bit in the cached SMMUTransCfg.
> >
> > Fixes: 9bde7f0674fe ("hw/arm/smmuv3: Implement translate callback")
> > Signed-off-by: Jean-Philippe Brucker <jean-philippe@linaro.org>
> 
> Applied patches 1 and 2 to target-arm.next, thanks.
> 
> For the future, if you send a multi-patch patchset could you
> make sure you always send it under a cover letter? Some of our
> tooling gets confused if the cover letter is missing (it doesn't
> show up in patchew, for example).

Sure, sorry about that

Thanks,
Jean

