Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 555546C0011
	for <lists+qemu-devel@lfdr.de>; Sun, 19 Mar 2023 09:40:07 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pdoYn-0006r6-El; Sun, 19 Mar 2023 04:38:37 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <smostafa@google.com>)
 id 1pdoYl-0006qq-Gu
 for qemu-devel@nongnu.org; Sun, 19 Mar 2023 04:38:35 -0400
Received: from mail-wm1-x330.google.com ([2a00:1450:4864:20::330])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <smostafa@google.com>)
 id 1pdoYk-0001Pt-0l
 for qemu-devel@nongnu.org; Sun, 19 Mar 2023 04:38:35 -0400
Received: by mail-wm1-x330.google.com with SMTP id
 5b1f17b1804b1-3ed2a586c34so130805e9.0
 for <qemu-devel@nongnu.org>; Sun, 19 Mar 2023 01:38:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=google.com; s=20210112; t=1679215110;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=mXHF1RLoBbsghn/HjjSG8kxQYvkXnSWpyk7Pkz6u2VI=;
 b=jhkKn3Z4IMFAT2HKiwLq/E1NEZge193DqdiCbDLlNqAePQOL55us0TXy2BXLgNG5DX
 oKNG4gpQy0X33JWh7eP80t2+LBk31GyXxCEEoto0cPTW7Lc1qA36SnfqvQyqChflHYe1
 t0THfZ9oUuwiaQsIgF9K6Upd1U4snCc6+W64mFBFmLCvGTHMlKBGslJiEgUF/lgQnBGs
 2b4mLL4rF+3sf2pTF6qxbSPzO46y7a/17g8Old3DRg4NWh8T2OFQ/oDUIeXg1tqyKwCl
 zpkZuL6MdXWD12n8HgmyRI/ZtyEnRLWwjfqYdOmaM6L1aptReNf70IYSnFjRR6j8za4t
 RzsQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1679215110;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=mXHF1RLoBbsghn/HjjSG8kxQYvkXnSWpyk7Pkz6u2VI=;
 b=h46+fdftz9ZxmJ4dVkHy8BlDG5omXNIlCDzTMYeW8BDL4+ZC0+v3jUsN2d6ieIqMrC
 x4a/uSnQ1Lm9iaX77hELLuE5ehZRSpINSaQnuhe5aiqztLiC0F+OQANsdCWFMev/6tXj
 bIWvWiux4162YYlwliUylfR1D5IxBR4Sh9V8GvHRdluLQgwNjMdptdWGUYGbaDwPiK7O
 4m1lcNMu65CO/gaNJ72rCbLi7SdiMP6tE2Y4KmrujYo1epVmrddSzofIzSRo4AJZM39L
 V7cSwMiLwlHDYTFvre5kVc/b+T/1nnxot1oDPSF1jZkopYMaQuKpTT2e0TSqmas+nKhC
 Zc7Q==
X-Gm-Message-State: AO0yUKVXrW4rrLxnj+YK9bl3Cyk5s+KxckgtvxaWmd2ukqVoEspcdoLZ
 sjkfkjX4tw1lohL/OgbF00gR0g==
X-Google-Smtp-Source: AK7set9mpS84Noi+MSz0G2LgSBWlqUyAJUmMg3+zw4c9COHfKUlkD2lJrkNSVzNjERo3iQ1qMdy6/g==
X-Received: by 2002:a05:600c:46c6:b0:3de:b7ba:f8ce with SMTP id
 q6-20020a05600c46c600b003deb7baf8cemr232564wmo.1.1679215110480; 
 Sun, 19 Mar 2023 01:38:30 -0700 (PDT)
Received: from google.com (44.232.78.34.bc.googleusercontent.com.
 [34.78.232.44]) by smtp.gmail.com with ESMTPSA id
 n17-20020adff091000000b002c5534db60bsm6101694wro.71.2023.03.19.01.38.29
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 19 Mar 2023 01:38:29 -0700 (PDT)
Date: Sun, 19 Mar 2023 08:38:24 +0000
From: Mostafa Saleh <smostafa@google.com>
To: Eric Auger <eric.auger@redhat.com>
Cc: qemu-devel@nongnu.org, jean-philippe@linaro.org,
 peter.maydell@linaro.org, qemu-arm@nongnu.org, richard.henderson@linaro.org
Subject: Re: [RFC PATCH v2 03/11] hw/arm/smmuv3: Refactor stage-1 PTW
Message-ID: <ZBbKAPs6xFHNKw37@google.com>
References: <20230226220650.1480786-1-smostafa@google.com>
 <20230226220650.1480786-4-smostafa@google.com>
 <13459f92-da9f-f7a8-9c18-1870a9def7e8@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <13459f92-da9f-f7a8-9c18-1870a9def7e8@redhat.com>
Received-SPF: pass client-ip=2a00:1450:4864:20::330;
 envelope-from=smostafa@google.com; helo=mail-wm1-x330.google.com
X-Spam_score_int: -175
X-Spam_score: -17.6
X-Spam_bar: -----------------
X-Spam_report: (-17.6 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_MED=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 ENV_AND_HDR_SPF_MATCH=-0.5, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001, USER_IN_DEF_DKIM_WL=-7.5,
 USER_IN_DEF_SPF_WL=-7.5 autolearn=ham autolearn_force=no
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

Hi Eric,

On Fri, Mar 17, 2023 at 07:31:06PM +0100, Eric Auger wrote:
> > +#define SMMU_LEVELS                         4
> > +
> > +#define SMMU_STRIDE(gran)                   ((gran) - SMMU_LEVELS + 1)
> > +#define SMMU_BIT_LVL(isz, strd, lvl)        ((isz) - (strd) * \
> > +                                             (SMMU_LEVELS - (lvl)))
> > +#define SMMU_IDXMSK(isz, strd, lvl)         ((1ULL << \
> > +                                             SMMU_BIT_LVL(isz, strd, lvl)) - 1)
> This looks good to me. Just a question about the BIT_LVL and IDXMSK
> defines. Do they correspond to any documented pseudocode functions
> documented somewhere in the ARM ARM?

I see they are not implemented as functions in ARM ARM, but as part of
aarch64/translation/vmsa_addrcalc/AArch64.TTBaseAddress:
	constant integer FINAL_LEVEL = 3;
	levels = FINAL_LEVEL - startlevel;
	tsize = (iasize - (levels*stride + granulebits)) + 3;
	tablebase = Align(tablebase, 1 << tsize);

This gives the same result, however the equations are a bit different as
they use final level(3), while we use number of levels(4).


Thanks,
Mostafa

