Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id CF1926C81B0
	for <lists+qemu-devel@lfdr.de>; Fri, 24 Mar 2023 16:45:04 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pfiel-0007li-AS; Fri, 24 Mar 2023 10:44:39 -0400
Received: from [2001:470:142:3::10] (helo=eggs.gnu.org)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1pfiej-0007lF-DZ
 for qemu-devel@nongnu.org; Fri, 24 Mar 2023 10:44:37 -0400
Received: from mail-ed1-x536.google.com ([2a00:1450:4864:20::536])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1pfieh-0002gw-OO
 for qemu-devel@nongnu.org; Fri, 24 Mar 2023 10:44:37 -0400
Received: by mail-ed1-x536.google.com with SMTP id ew6so8774927edb.7
 for <qemu-devel@nongnu.org>; Fri, 24 Mar 2023 07:44:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1679669071;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=W45tOSJhqYNEWGgxXTEfvdgQvdmXAQERfBY3j3o1cPE=;
 b=iVOiJpcE1bOskCkBySIrrKbzLNLhZ/K2agHSReBU4V3blpEyDBb5WZm5nsSUzIX2Eb
 7LJUOkneIpfhzSFYQidnrh3xsu5WbdTBMd1UO8KpP5CCkaakhN3FQbXZeYksIYz+x5RJ
 tADG2rpcybaulcr5M0g59Nx0lUtniWF50w1PiOMuQHGBan4fRHCuw9Iekykd9rJ60xZA
 Z3swIflCgoYCoOXVwrkGTIIsh8Demhy0XyzPY4vcFVwlswbwf5kDfFMH5651XhPVICFA
 3Oi/REd9Nc2B3o07T3xSXUgyTZ6v++sJrPQV541J/NxS4MNf0Kc1Cm9QkV0o9drKDOmK
 XIOg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1679669071;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=W45tOSJhqYNEWGgxXTEfvdgQvdmXAQERfBY3j3o1cPE=;
 b=2ZcgwlDgtodshm1kP8HMAP5wkpfXH50/xC02GWkuUHe5jaRbzf1SaQCK7q7d6SHBl7
 ckCQLUgKKIfHTeJw6lOiEhhOosbK+GnUhKgLEbNbuUFl8Q0ZH9h0Nw+0lthuoGiOIrRd
 FDeVHWNpUsdY7w0lCSs1qqAFv4BswRtCkp0Yza3zXMYMPGJYeGJkGUQrBpGa4SmiI8CM
 4hTJjcE2tzS7I4jdihWBBuFTq4ZqZZVYYfh86pKtzgi7Ov5DCXNP/lw/iap8MgXlLBKh
 0qZZ4eGO9C5hJ0t6pnjbrkgshTtDAmR0+P0w3PkcWkFPtvd9T/hRXEYjQJwQJ0WQS82r
 XdHQ==
X-Gm-Message-State: AAQBX9d95YBJyNzrp9ceKQOiRhdm2ReIyC+79144RdSEKwdC6OjZxW9e
 UEFANZ1v1K9GxjUhkV8MNUO+bzx1m7wHpj0NvAoCHA==
X-Google-Smtp-Source: AKy350ZJlko1teFIKA/RhDo2E5gK5W675u8kmKfnHB8ilxTfaclFu1yyniYaN3RUnFCqWWmfxXbodmhOVlFl5b/Oh+g=
X-Received: by 2002:a50:9fae:0:b0:501:c965:33bd with SMTP id
 c43-20020a509fae000000b00501c96533bdmr1526336edf.6.1679669070106; Fri, 24 Mar
 2023 07:44:30 -0700 (PDT)
MIME-Version: 1.0
References: <20230323100200.12986-1-anthony.perard@citrix.com>
 <758626c4-f46f-471e-81c0-58e82f6623b1@perard>
In-Reply-To: <758626c4-f46f-471e-81c0-58e82f6623b1@perard>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Fri, 24 Mar 2023 14:44:19 +0000
Message-ID: <CAFEAcA88YVgwLYEbkgmSumPp9o3jEgyFCjUJ2g6XZH+Sd-sMWw@mail.gmail.com>
Subject: Re: [PULL 0/1] xen queue
To: Anthony PERARD <anthony.perard@citrix.com>
Cc: qemu-devel@nongnu.org
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::536;
 envelope-from=peter.maydell@linaro.org; helo=mail-ed1-x536.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
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

On Fri, 24 Mar 2023 at 13:47, Anthony PERARD <anthony.perard@citrix.com> wrote:
>
> On Thu, Mar 23, 2023 at 10:01:59AM +0000, Anthony PERARD wrote:
> > The following changes since commit 60ca584b8af0de525656f959991a440f8c191f12:
> >
> >   Merge tag 'pull-for-8.0-220323-1' of https://gitlab.com/stsquad/qemu into staging (2023-03-22 17:58:12 +0000)
> >
> > are available in the Git repository at:
> >
> >   https://xenbits.xen.org/git-http/people/aperard/qemu-dm.git tags/pull-xen-20230323
> >
> > for you to fetch changes up to f75e4f2234e7339c16c1dba048bf131a2a948f84:
> >
> >   accel/xen: Fix DM state change notification in dm_restrict mode (2023-03-23 09:56:54 +0000)
> >
> > ----------------------------------------------------------------
> > Xen queue
> >
> > - fix guest creation when -xen-domid-restrict is used
>
> Hi Peter,
>
> I'd like to cancel this pull request. I've got another patch to add to
> it. Is that fine? If I don't have any reply, I'll create a new PR later
> today and consider this one cancel.

That's fine. I had been holding off on it until I could combine it
with another, to save on the CI resources...

-- PMM

