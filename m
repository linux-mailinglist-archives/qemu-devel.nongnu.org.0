Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id CFED833970D
	for <lists+qemu-devel@lfdr.de>; Fri, 12 Mar 2021 20:04:48 +0100 (CET)
Received: from localhost ([::1]:49256 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lKn5b-00077z-SG
	for lists+qemu-devel@lfdr.de; Fri, 12 Mar 2021 14:04:47 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:36602)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1lKlsq-0003vQ-6B
 for qemu-devel@nongnu.org; Fri, 12 Mar 2021 12:47:32 -0500
Received: from mail-ed1-x52e.google.com ([2a00:1450:4864:20::52e]:41781)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1lKlsm-00021V-2X
 for qemu-devel@nongnu.org; Fri, 12 Mar 2021 12:47:31 -0500
Received: by mail-ed1-x52e.google.com with SMTP id z1so9150385edb.8
 for <qemu-devel@nongnu.org>; Fri, 12 Mar 2021 09:47:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=nQ3QZrGQHFcGMfVcKdDS/n9iBQ+MgSkkyAEPKyWfRow=;
 b=y3D3+97dHWlW++4lrW/IxMZ9crCZzpaatP7RxH3OTbYyXGKRIuoVp1pBDq24DNSxUZ
 ycopy12Mhff+Eu3+fPmbpehbUp7bNb+zN6fE+w6FcmTVVTbL11035vzT9Rm43L7y9Nhp
 iJIhWYeYvCoGixsj6q+bZ7k9tgTQNhOxtsr4RzZWEA/3BdZ4YiUq7rKZLXwb1AXSifiM
 kTE4yt/OcYcsXkwfiKmxj9ShYt2+FRR4OUIn9gspJ9qEI/fx8UfmW3l5loVE4cZq8pIP
 +hAwPXJDdZOGWYUGAtm3mO93gfL5p3i4uGPhoJkl1zpf8PrVGp6SXGAQcfMPVqmvwHRp
 Wqkg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=nQ3QZrGQHFcGMfVcKdDS/n9iBQ+MgSkkyAEPKyWfRow=;
 b=eeiILdCuGZXeHoxP91TwlaQ1EXb+mJytCZMGAxD9Db/qZ5/0uGQycC7IecB/P+WPs0
 KBCaeH0k+XhojamVOvJx3oGenBEy4Lv4S/50kfGNuyvdo+9rNKNuvdB7lrt/SgrU4XtS
 ww1kj9pOMyY55Ulig0l60nVGq52qTj/YTpV/OgbhsOGahcYkIfErL+LS82Dsjwq3O4GB
 cu6UWNMlZMSR0jc8ugOxB1eXCrzodIGEl+j03A7MpNZQeDQmfJDK5piLJXu6OIitlTbj
 GVMATURUSri0ungP5+SSzLtxUK8Zl7mnXe5uQoxLHY3uq/RvWGRp8frLd31H9GfS+jIL
 vBlQ==
X-Gm-Message-State: AOAM533mzO8VQ17LMYHGRcaFeHOc/wvm4wAvLL0yTKxfVyfRxpBpNHfw
 U46zA2ZLysiQYkpy/decXG8WGDvAXdyUn2xNaqVYbw==
X-Google-Smtp-Source: ABdhPJwI3avZFc0Bcj+oVdSccxTbX4S7N58JCyvS6JEvYeUCOB+Wfj6jr7z+qgW4MdgyKe1n6OJgs2SelSNKrr4HHi0=
X-Received: by 2002:a05:6402:4244:: with SMTP id
 g4mr3954503edb.204.1615571243967; 
 Fri, 12 Mar 2021 09:47:23 -0800 (PST)
MIME-Version: 1.0
References: <20210311123401.340122-1-kraxel@redhat.com>
In-Reply-To: <20210311123401.340122-1-kraxel@redhat.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Fri, 12 Mar 2021 17:47:05 +0000
Message-ID: <CAFEAcA92efSt4wv7ToEXb5VZ-DcS7SqHoNPxXp9-_NZ8kj5hRw@mail.gmail.com>
Subject: Re: [PULL 0/8] Ui 20210311 patches
To: Gerd Hoffmann <kraxel@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::52e;
 envelope-from=peter.maydell@linaro.org; helo=mail-ed1-x52e.google.com
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

On Thu, 11 Mar 2021 at 12:34, Gerd Hoffmann <kraxel@redhat.com> wrote:
>
> The following changes since commit 821e7ed167f11f482d2d1a8eaf114a667295a581:
>
>   Merge remote-tracking branch 'remotes/thuth-gitlab/tags/pull-request-2021-0=
> 3-09' into staging (2021-03-10 17:22:45 +0000)
>
> are available in the Git repository at:
>
>   git://git.kraxel.org/qemu tags/ui-20210311-pull-request
>
> for you to fetch changes up to d1929069e355afb809a50a7f6b6affdea399cc8c:
>
>   ui/cocoa: Fix mouse association state (2021-03-11 13:33:20 +0100)
>
> ----------------------------------------------------------------
> ui: mostly cocoa fixes
>
> ----------------------------------------------------------------
>


Applied, thanks.

Please update the changelog at https://wiki.qemu.org/ChangeLog/6.0
for any user-visible changes.

-- PMM

