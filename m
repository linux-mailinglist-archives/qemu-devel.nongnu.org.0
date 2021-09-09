Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id ADE2F405DF3
	for <lists+qemu-devel@lfdr.de>; Thu,  9 Sep 2021 22:18:43 +0200 (CEST)
Received: from localhost ([::1]:55962 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mOQVO-0004cA-7M
	for lists+qemu-devel@lfdr.de; Thu, 09 Sep 2021 16:18:42 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:45060)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <shashi.mallela@linaro.org>)
 id 1mOQUT-0003xi-GY
 for qemu-devel@nongnu.org; Thu, 09 Sep 2021 16:17:45 -0400
Received: from mail-qt1-x833.google.com ([2607:f8b0:4864:20::833]:34563)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <shashi.mallela@linaro.org>)
 id 1mOQUR-0002VE-RR
 for qemu-devel@nongnu.org; Thu, 09 Sep 2021 16:17:44 -0400
Received: by mail-qt1-x833.google.com with SMTP id 2so2627737qtw.1
 for <qemu-devel@nongnu.org>; Thu, 09 Sep 2021 13:17:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=message-id:subject:from:to:date:mime-version
 :content-transfer-encoding;
 bh=Z/hA6GCcoj1kJFnjRttwvB1R1xbyW+o6vO7jPJ0Hq3A=;
 b=S90vOCX/jUYAkbEmhIAZQIf7Qdm3SeXVxGzLsDwBv7SHOtu5+3rW8wiJnKAh4j5Yl9
 DDIl5FUaDU92CU87TbpnWkQlEfC8qflLATNclFxAEVHy4W+11U+w0Bo1ZbYqK9kUXFfX
 MTklHOEzl8nleMDzVWIOecoWr8trrIVyoctQxotCQlQopFShLTIXlGYaXw04KFmNXbFa
 cHZVEdo7B9Us4saZNaWWSnLaer37jJHGjIi4ZO1eG/PAovtFs2iahpR7jtlgpVr81zUd
 zCHZN62oDCqWqY4Zavsjnd2LnF070AoqCd/SBuE3cFoT6WvoqqEieNk58eupiEngEbHX
 2ujA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:subject:from:to:date:mime-version
 :content-transfer-encoding;
 bh=Z/hA6GCcoj1kJFnjRttwvB1R1xbyW+o6vO7jPJ0Hq3A=;
 b=ElXwFcZw2d3QSctQ4tv6ve6aUkc4VjRYwUGsJUhflpw3JUoLyMi8j1wCyhAiQif32z
 fRY4w56ibFVSZ6zAFDUTbf/dM8c1obMSevK84DGh8hv/Mmmc/8fnnrpDNfm02lklK+t2
 nuuGFMs1mTMGP2cYQJ+oUqDlfJlBM+IsGky9i/P83CkYfEynNb1sFnR0M+wYAngs0iIS
 77HtmzJDAk7cw9Cqmy9pa7Pj9bMmAVE/d0RvrL14UVMqteJ8/kZJGNaSngZ5JFLrzK3h
 TdDtPYkWqmNJlqxw525tn3YZhVW+Ga03cCtu/1qv9cZpMTRXyufJLxDr/Kq2WsWz/OzC
 dKdw==
X-Gm-Message-State: AOAM530Aim6YA9qRTtWmH900cybsrnNpyY18NCbB7pOk6RGliuinPhFb
 PAi/XvMJgQ8ubuvm46WU754QhH4RQ/WYNw==
X-Google-Smtp-Source: ABdhPJw+kx1XMmngF+Z0ihRDj5h9t3378XJu10vAmEV0JygZsFv1bghVMtaaFsDBF4Ql3BY/QcaEDA==
X-Received: by 2002:ac8:4c9c:: with SMTP id j28mr4542704qtv.224.1631218662155; 
 Thu, 09 Sep 2021 13:17:42 -0700 (PDT)
Received: from localhost.localdomain
 (bras-base-stsvon1503w-grc-22-142-114-143-47.dsl.bell.ca. [142.114.143.47])
 by smtp.gmail.com with ESMTPSA id m5sm2048121qkn.33.2021.09.09.13.17.41
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 09 Sep 2021 13:17:41 -0700 (PDT)
Message-ID: <bac0b38fc7c5f7a5a1c91784eb7236de39b6f18a.camel@linaro.org>
Subject: SMMU Stage 2 translation in QEMU
From: shashi.mallela@linaro.org
To: QEMU Developers <qemu-devel@nongnu.org>
Date: Thu, 09 Sep 2021 16:17:40 -0400
Content-Type: text/plain; charset="UTF-8"
X-Mailer: Evolution 3.28.5 (3.28.5-16.el8) 
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::833;
 envelope-from=shashi.mallela@linaro.org; helo=mail-qt1-x833.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.23
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

Hi All,

I am trying to understand the approach required for an emulated SMMU to
convert IPAs(from each qemu guest) to PAs(respective host addresses)
using stage 2 tables.

The questions i have are:-

1) Since SMMU stage 2 tables are expected to be created and managed by
a hypervisor,if there is no kvm support,who is responsible to create
the stage 2 tables in host memory? is it even a valid use case to
consider smmu stage 2 support with no hypervisor present?

2) with SMMU emulated by qemu:-
a) who is responsible for hosting and programming the stage 2 table
base address registers? 
b) what are the APIs available in qemu to access the stage 2 tables?
(will address_space_ API variants apply here?)

3) if each qemu instance (for a guest) emulates an SMMU,will there be a
need to protect concurrent access of stage 2 table(in host) by each of
the SMMUs?

Thanks
Shashi


