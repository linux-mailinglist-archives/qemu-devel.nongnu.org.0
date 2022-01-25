Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8F0A049B239
	for <lists+qemu-devel@lfdr.de>; Tue, 25 Jan 2022 11:48:57 +0100 (CET)
Received: from localhost ([::1]:54514 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nCJNg-00031t-Jn
	for lists+qemu-devel@lfdr.de; Tue, 25 Jan 2022 05:48:56 -0500
Received: from eggs.gnu.org ([209.51.188.92]:46744)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1nCJDC-0000hc-2D
 for qemu-devel@nongnu.org; Tue, 25 Jan 2022 05:38:06 -0500
Received: from [2a00:1450:4864:20::434] (port=46040
 helo=mail-wr1-x434.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1nCJCQ-0006zl-MV
 for qemu-devel@nongnu.org; Tue, 25 Jan 2022 05:38:05 -0500
Received: by mail-wr1-x434.google.com with SMTP id r25so2294655wrc.12
 for <qemu-devel@nongnu.org>; Tue, 25 Jan 2022 02:36:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=uni/a5Six3Bg5U2jMsNPhWm9m66NRGsLyEZHsT6w9OA=;
 b=DTpq7o6R0zS5SOVzf1X6xNuJTMDZ7K2jhnHyjEe+hWE1+/OQ1CVqRGu99CnSX+kB+d
 4v0b4y0QFdWefFHNQ0afT1CbsIs/LR/ftu8ZdNgGzgWny469IC5s/FNRLryfJMXNE5up
 9Wb47u21EtF85/Nj/tbMRg/+t0Bv17ygpl1oVOjBtcxs73rzFUzVeGbXek5eVl/UoxLu
 XV8GI+YRMU6DMw6BMTcvSkeygwbehxV6sbHPitpIZ1bSdtBzIxrdLmx3xdZgo2pPzS9z
 krpPm197as9XF59YLwLkaWskRAF6fCbAQr+zH6iFkqOibmTZf1IAKKDiSNTTkLLWcxh+
 UUjQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=uni/a5Six3Bg5U2jMsNPhWm9m66NRGsLyEZHsT6w9OA=;
 b=pNnjFQMBBKz5BkAfVBPpCGNSHSajWW5qa6vqrILlniks4tp/LrxUoWjN5mlv+w7Txn
 pMNcpDxaNSkFswUkSm46+nXTcziD3q61VASL1a+2Br08TBRwFayWGQ2p5mGAdtA97ZXI
 RR/oyw7xkiNULcILM8KMkTxV3rNPzx1fVvCTkrZ7vyujLF0HCBcHq351b0Xs60pRYuI8
 YW9PiUG56s/oXBuoJOuGgMLPfEw7HLODCgGJV68H5aeftMa1nvcx9/LueWQ6G9S0wY7t
 7RJqRFNHK5xObV7QSnuv/7sjDfFxKa3hQnJXnyEhtGlbtDBH56/XZxvDwc7/Dspot7lK
 sQ1A==
X-Gm-Message-State: AOAM532ddUnmfrJxakshBX7+KirtQuWkoo5crNpuVKTxiajCcRTfsNl6
 3MCaDqZ5WBtSHTDlV+QMkYaL0yEFwmAhB7sNIZnPDg==
X-Google-Smtp-Source: ABdhPJz1trkpYma09n1Sk/lNTt2m7nvEI4+ZnmgfpOON0L9NIM3ZrqMYrjrvH/zOeO5/79BkxmouwEG/0DjYfJfyiCY=
X-Received: by 2002:a05:6000:1d87:: with SMTP id
 bk7mr18067786wrb.2.1643107012764; 
 Tue, 25 Jan 2022 02:36:52 -0800 (PST)
MIME-Version: 1.0
References: <20220118104434.4117879-1-peter.maydell@linaro.org>
 <87lez4w787.fsf@secure.mitica>
In-Reply-To: <87lez4w787.fsf@secure.mitica>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Tue, 25 Jan 2022 10:36:41 +0000
Message-ID: <CAFEAcA89qNx+PidATULrq8a4rab=f2NLknJvEKVun5MRbb50eQ@mail.gmail.com>
Subject: Re: [PATCH] Remove unnecessary minimum_version_id_old fields
To: quintela@redhat.com
Content-Type: text/plain; charset="UTF-8"
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::434
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::434;
 envelope-from=peter.maydell@linaro.org; helo=mail-wr1-x434.google.com
X-Spam_score_int: -12
X-Spam_score: -1.3
X-Spam_bar: -
X-Spam_report: (-1.3 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 PDS_HP_HELO_NORDNS=0.001, RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
Cc: qemu-devel@nongnu.org, "Dr . David Alan Gilbert" <dgilbert@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Tue, 25 Jan 2022 at 08:27, Juan Quintela <quintela@redhat.com> wrote:
>
> Peter Maydell <peter.maydell@linaro.org> wrote:
> > The migration code will not look at a VMStateDescription's
> > minimum_version_id_old field unless that VMSD has set the
> > load_state_old field to something non-NULL.  (The purpose of
> > minimum_version_id_old is to specify what migration version is needed
> > for the code in the function pointed to by load_state_old to be able
> > to handle it on incoming migration.)
> >
> > We have exactly one VMSD which still has a load_state_old,
> > in the PPC CPU; every other VMSD which sets minimum_version_id_old
> > is doing so unnecessarily. Delete all the unnecessary ones.
> >
> > Commit created with:
> >   sed -i '/\.minimum_version_id_old/d' $(git grep -l '\.minimum_version_id_old')
> > with the one legitimate use then hand-edited back in.
> >
> > Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
>
> Hi
>
> Should this came through the migration tree?

That seems like a good way to take it into the tree, yes.

thanks
-- PMM

