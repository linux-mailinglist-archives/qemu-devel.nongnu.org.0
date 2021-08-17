Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3BD0B3EE905
	for <lists+qemu-devel@lfdr.de>; Tue, 17 Aug 2021 11:01:50 +0200 (CEST)
Received: from localhost ([::1]:35240 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mFuyj-0004tA-A2
	for lists+qemu-devel@lfdr.de; Tue, 17 Aug 2021 05:01:49 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:60430)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1mFuwu-0003XH-G9
 for qemu-devel@nongnu.org; Tue, 17 Aug 2021 04:59:56 -0400
Received: from mail-ed1-x533.google.com ([2a00:1450:4864:20::533]:42945)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1mFuws-0007Jd-UR
 for qemu-devel@nongnu.org; Tue, 17 Aug 2021 04:59:56 -0400
Received: by mail-ed1-x533.google.com with SMTP id bo19so30508106edb.9
 for <qemu-devel@nongnu.org>; Tue, 17 Aug 2021 01:59:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=kxFfb/c2Bwvv+ZXXwaMm/7wh4+/2MPLEcjU5UHjvX5g=;
 b=FSTUuxUVc0DqA8j47fGXSOuxuYcN48+Kb2aSXCDPBXJ20BKPBfUIytZqvqjr9MWQ4E
 U1j9cibJJGLB0CwPrTmd8tWu2qTaBDO9E8DuCyaYQYVTUs5SU7pIeWQIE+wQ6zGkJYIc
 8eJ2O3HaaudjmG/4SWoz4pbp4vWEbTvW7VGqRawIQM9cxvewuTuEcQKXnKhyDEQzU0Ve
 UG/MR/KPzveex8vLWno3Bn7md46+SH0bHJstNQ8TLbNG9ASz+ENkiNgQtOujhcEwVQ15
 5vk82TmW2oydDjicwDlHWkzK1xKgFeCsHosbnqZweA8j/yzojSDsL8+WLqO+pRH/MXrE
 lwVA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=kxFfb/c2Bwvv+ZXXwaMm/7wh4+/2MPLEcjU5UHjvX5g=;
 b=dhWbLBLTGkjAFwuiLQAzcLIzz7EUiE7caQuJWO5KVQZsaUGOZ7N63xTKlam87AVDdD
 tPAFv1lw2bZJ//O7yw6AkZe2deyC2ynQIm/TWzbTrAox9mFZh5YanD05GDDRYAJ5vBvF
 CiDl89RFySw7DQojBlsXvIgW6jZcZbav5CLhGmPWq3GWP55PIuMYOZDOaQPqzsD+GsyN
 D3dNWNycffef63agdcZN/8U4vJ9CqAlFsdjtjJAGifABwFpbBztmZj4SIjikRiA6EZMj
 xhj4ywCNZEuBHq3U0j6X0PTWfrhpXBOLDzrGWqzshe8kudjEt5ac6lvsbjLbQurx46Sh
 xgOQ==
X-Gm-Message-State: AOAM532K7cvV3nNbxudCJ2fapQZ4bbBvJWusdpDxzMxCobS2YbqY5zg2
 KtX+fSLY13Ktb9Ul4zmigUiOK4H0y6Ofp7ltkZ694A==
X-Google-Smtp-Source: ABdhPJzE2rwr5MpxH+8R7ccXBlu3aTvNwoVm7qru3mW23tIXqCFWMLpP8I3mhj+yebadMYYL0lCzB1w5/RhkKOulRvU=
X-Received: by 2002:a05:6402:4387:: with SMTP id
 o7mr2978109edc.204.1629190793098; 
 Tue, 17 Aug 2021 01:59:53 -0700 (PDT)
MIME-Version: 1.0
References: <797ADA26-0366-447F-85F0-5E27DC534479@gmail.com>
 <CAMVc7JXgn5ttSEjPB_=rS9CsYiQOFS48hcAbr3NQnom-qk75VA@mail.gmail.com>
 <F9601D44-9866-4CB7-B611-D8930DFBBE15@gmail.com>
 <CAFEAcA-vGe5BQg6HVtub5mDD6CtQN1OKGPE3Q8eJsjqyDCROnw@mail.gmail.com>
 <247B2DB8-1076-4617-AE63-8791571A12D4@gmail.com>
 <CAC5464E-0E9B-4B0B-A844-2F4F3AADCCF5@gmail.com>
In-Reply-To: <CAC5464E-0E9B-4B0B-A844-2F4F3AADCCF5@gmail.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Tue, 17 Aug 2021 09:59:06 +0100
Message-ID: <CAFEAcA_fcg-opZa9UCLy6f7x4gMk6jhX9236nu3BDU1WuC+f=w@mail.gmail.com>
Subject: Re: Picture missing in About dialog on cocoa ui
To: Programmingkid <programmingkidx@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::533;
 envelope-from=peter.maydell@linaro.org; helo=mail-ed1-x533.google.com
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
Cc: QEMU devel list <qemu-devel@nongnu.org>,
 Akihiko Odaki <akihiko.odaki@gmail.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Mon, 16 Aug 2021 at 21:55, Programmingkid <programmingkidx@gmail.com> wrote:
>
>
>
> > On Jul 8, 2021, at 2:38 PM, Programmingkid <programmingkidx@gmail.com> wrote:
> >
> >
> >
> >> On Jul 8, 2021, at 1:50 PM, Peter Maydell <peter.maydell@linaro.org> wrote:
> >>
> >> On Thu, 8 Jul 2021 at 17:28, Programmingkid <programmingkidx@gmail.com> wrote:
> >>> The problem with e31746ecf8dd2f25f687c94ac14016a3ba5debfc is it requires a
> >>> picture file to be found in a certain path. My original code used QEMU's
> >>> icon to obtain a picture. The reason why the picture in the About dialog
> >>> stopped appearing was because of the move to the meson build system.
> >>> A new patch has just been committed that fixes the missing icon issue.
> >>> Using 'git revert e31746ecf8dd2f25f687c94ac14016a3ba5debfc' fixes the
> >>> missing picture issue in the About dialog.
>
>
> Hi Peter, I was wondering if you had made a decision on whether you plan on reverting the patch that breaks the About dialog for the Cocoa UI.

No, reverting looks like the wrong thing. If get_relocated_path()
doesn't work then we should find and fix that bug.

-- PMM

