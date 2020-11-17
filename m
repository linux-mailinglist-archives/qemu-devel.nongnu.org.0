Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A809D2B5DFF
	for <lists+qemu-devel@lfdr.de>; Tue, 17 Nov 2020 12:09:34 +0100 (CET)
Received: from localhost ([::1]:51574 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1keyrd-0003xM-OK
	for lists+qemu-devel@lfdr.de; Tue, 17 Nov 2020 06:09:33 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:41780)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1keypC-0002cK-KY
 for qemu-devel@nongnu.org; Tue, 17 Nov 2020 06:07:02 -0500
Received: from mail-ej1-x636.google.com ([2a00:1450:4864:20::636]:38523)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1keypA-0002T8-MN
 for qemu-devel@nongnu.org; Tue, 17 Nov 2020 06:07:02 -0500
Received: by mail-ej1-x636.google.com with SMTP id a16so1061262ejj.5
 for <qemu-devel@nongnu.org>; Tue, 17 Nov 2020 03:06:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=+0aqOQlDN4nOL2xu0vsmp3zJjUIMOpmgmC4P1TACRc0=;
 b=Fu4Rxg6e5djA08HuGXyWJGhsDDeZMl/OQbaWRU41FBniNAdpe9E6XCarQwO0/lrz37
 H3zXWBID7g+uSqO+UkavBLG0jGesKREFoXGowqyoC3iF8lGxw4q2gc5WpCHCGJkDUmN7
 D0AbuzZ7dySfcrBaMH0gx7Pf1WvehEVxTB1qcAiXtsP1+xzDH2KfQxSzBEOb+mavnvQF
 Lea2UTwitMieCW7xCUIZs/IOvucLyZUlEfvlxOfdPbLmS2K+NiOeJFP4lvR7GoNUupSc
 9KSengkz0cXbns+r7HV9wtFi5QG10TDdbQ5IjRkWvk3wGhTcRy8wkO+FWnKPP/KSQivz
 EC7g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=+0aqOQlDN4nOL2xu0vsmp3zJjUIMOpmgmC4P1TACRc0=;
 b=DErCsFPt+BtTBmX25YZLsguJhDDVqYx3GtxGlcggfNW0pxYhQA0tCcvv6Drb3oldmf
 3Q7XWPW8++pbXgo54OHAJPmQPhKG/rrMae6ODzjohIP9AkyqeEnkmtnVwf3V2CTxnPbf
 VAFOT79UWERbQLhgwNUMkwNY/or7GK3nqdUTZ547L2JnM/Bs0KnbVyjHjf4PXS9rhkc4
 Sylp7U1EvVPtADomB4fP/NTBbEg2ND1IkAOAmeUUGbEImMgFiVqT8KmvmNryiDYs9hdY
 xv8/w5RvWVUaKGNbbxWo0of4uA/I6vYtQZAJUxOzmsnwYv9Smo1BzBfG0qJMUXg5Qoq/
 tW3g==
X-Gm-Message-State: AOAM531KwZ962Gxb0bXEkd0iw+MI050UxPwmcHDqAl72WIEHetqtKRPK
 LUel6rbGZia3RfeU6l2pnFJhp++HVYMKLvDMjqotfQ==
X-Google-Smtp-Source: ABdhPJzb6SEYrQP9grpkdsgtC1IPSyogb+pqsDw4Zhy2dAwO3zD/NHNNMhNissslN2Hq2Ql0mCNBBJ+2mGEj9b9UxeI=
X-Received: by 2002:a17:906:5a88:: with SMTP id
 l8mr18202661ejq.407.1605611216666; 
 Tue, 17 Nov 2020 03:06:56 -0800 (PST)
MIME-Version: 1.0
References: <20201116195815.48264-1-pbonzini@redhat.com>
In-Reply-To: <20201116195815.48264-1-pbonzini@redhat.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Tue, 17 Nov 2020 11:06:45 +0000
Message-ID: <CAFEAcA-StiVcfqA8-YOvVHeGG6dp+QD9tPyZ2NX9tcDRDvHN6w@mail.gmail.com>
Subject: Re: [PULL 0/5] Misc fixes for QEMU 5.2
To: Paolo Bonzini <pbonzini@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::636;
 envelope-from=peter.maydell@linaro.org; helo=mail-ej1-x636.google.com
X-detected-operating-system: by eggs.gnu.org: No matching host in p0f cache.
 That's all we know.
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
Cc: QEMU Developers <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Mon, 16 Nov 2020 at 20:08, Paolo Bonzini <pbonzini@redhat.com> wrote:
>
> The following changes since commit cb5ed407a1ddadf788fd373fed41c87c9e81e5b0:
>
>   Merge remote-tracking branch 'remotes/huth-gitlab/tags/pull-request-2020-11-15' into staging (2020-11-16 17:00:36 +0000)
>
> are available in the Git repository at:
>
>   https://gitlab.com/bonzini/qemu.git tags/for-upstream
>
> for you to fetch changes up to 1370d61ae3c9934861d2349349447605202f04e9:
>
>   memory: Skip dirty tracking for un-migratable memory regions (2020-11-16 13:22:25 -0500)
>
> ----------------------------------------------------------------
> Bug fixes
>


Applied, thanks.

Please update the changelog at https://wiki.qemu.org/ChangeLog/5.2
for any user-visible changes.

-- PMM

