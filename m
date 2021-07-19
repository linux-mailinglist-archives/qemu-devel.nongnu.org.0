Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3BC123CD084
	for <lists+qemu-devel@lfdr.de>; Mon, 19 Jul 2021 11:21:31 +0200 (CEST)
Received: from localhost ([::1]:44552 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m5PSs-00033R-AC
	for lists+qemu-devel@lfdr.de; Mon, 19 Jul 2021 05:21:30 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:60976)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1m5PRa-00022g-RC
 for qemu-devel@nongnu.org; Mon, 19 Jul 2021 05:20:10 -0400
Received: from mail-ej1-x62e.google.com ([2a00:1450:4864:20::62e]:34624)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1m5PRZ-0003Gc-4v
 for qemu-devel@nongnu.org; Mon, 19 Jul 2021 05:20:10 -0400
Received: by mail-ej1-x62e.google.com with SMTP id hr1so27575696ejc.1
 for <qemu-devel@nongnu.org>; Mon, 19 Jul 2021 02:20:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=xNQ7GKPxwzM9Viq9vo56Q5+3Xu4ku0yeIttuGSlXgOY=;
 b=b2UBLUZLz84+07yuch7XNNxyYlXos/iHCp6Dw3PuEY2gs8OhjxotabAoHpC0F1J+A/
 u3QP3XqONmR/kQt6xwa7RtdlY7Kpgfj4JLFeDI/qOHyg/+Sg9Y9h5OjKHRE0ds7xdwLG
 YLLJjyFPIhDNEYdtHfxWQJyF1mnblk6LgLhMcPh9RfNhHmGu4mqO3QEgcjSs6A5FpPLl
 J6+s91YNNouUc6JuDpqpdx+pANU3mpdUZxsT0gbirjOF6rqLSgCBjpS1L2wb6ReiHbe1
 JPdjQ4rvAW/WC7AluLNDl9Z8sJczOlqEm8oUt35sdHU4i9tfRAap7L1eDYMAt3lsouTy
 lVIA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=xNQ7GKPxwzM9Viq9vo56Q5+3Xu4ku0yeIttuGSlXgOY=;
 b=m7DXN6jg/Rtg6LPiSZCbKzHVWHwfdyneC4Qf8dDbg+ZOnFL3K6XgODifYPMP9Dym6d
 fjXdM8O1hn2Kzb8GFkgwQyogp+1WB8KpqqQwo6747eIgOZWn+/CFBnfA+Wl5aK+mLb2B
 qyenWpj7uKj3RQtUsMNVTvNeqgPgBC6dbAVkcRGf0BO+/+JN1E22IWp2jAkUytz28zbG
 ait/BW/rNKbxzKJVhHzBSo/ahF0gjTngIh4DA+t42J9RyUaLLypmCF6YAWc3P2Szqdc4
 lNDniJ3+CSDoYbG01ymyPZkJd1+9k222zEMzCmGwRzebjJJtaiuc/2Ax49ii0Or+SpJn
 Zgtg==
X-Gm-Message-State: AOAM531kWmC42KMr4Jhv0z0ycsu7d6Kt/WmLlOrFAglDttHTLdYGLZ/N
 6NHoG/Q1KObIEQrJ9u/SCMBoMoKFxclTMvR2hqBNuQ==
X-Google-Smtp-Source: ABdhPJzZNaosrwzuxz9ZszxSkE9FTVBwUs4VZtxVmANbDoT9xrJ1z1jMgZJ2N3qaohT5bSW8XFnp9EFdZx1fAiLa/x8=
X-Received: by 2002:a17:906:16cd:: with SMTP id
 t13mr26764765ejd.250.1626686407112; 
 Mon, 19 Jul 2021 02:20:07 -0700 (PDT)
MIME-Version: 1.0
References: <20210719090051.3824672-1-chen.zhang@intel.com>
In-Reply-To: <20210719090051.3824672-1-chen.zhang@intel.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Mon, 19 Jul 2021 10:19:26 +0100
Message-ID: <CAFEAcA8Z6Nm6DABFOyv1pVEK=CbXdnhpYp6jE7i8ztw5mi+8gw@mail.gmail.com>
Subject: Re: [PULL V3 for 6.2 0/6] COLO-Proxy patches for 2021-06-25
To: Zhang Chen <chen.zhang@intel.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::62e;
 envelope-from=peter.maydell@linaro.org; helo=mail-ej1-x62e.google.com
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
Cc: Lukas Straub <lukasstraub2@web.de>,
 =?UTF-8?Q?Daniel_P=2E_Berrang=C3=A9?= <berrange@redhat.com>,
 Li Zhijian <lizhijian@cn.fujitsu.com>, qemu-dev <qemu-devel@nongnu.org>,
 Jason Wang <jasowang@redhat.com>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>,
 Markus Armbruster <armbru@redhat.com>, Gerd Hoffmann <kraxel@redhat.com>,
 Eric Blake <eblake@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Mon, 19 Jul 2021 at 10:10, Zhang Chen <chen.zhang@intel.com> wrote:
>
> Hi Jason,
>
> Please help to queue COLO-proxy patches to net branch.

Hi Chen; for this kind of pull request that isn't intended
to go directly into master, could I ask you to follow the notes
in https://wiki.qemu.org/Contribute/SubmitAPullRequest
for not-for-master pullrequests, please?

# Pull requests not for master should say "not for master" and have
# "PULL SUBSYSTEM whatever" in the subject tag. If your pull request
# is targeting a stable branch or some submaintainer tree, please
# include the string "not for master" in the cover letter email, and
# make sure the subject tag is "PULL SUBSYSTEM s390/block/whatever"
# rather than just "PULL". This allows it to be automatically filtered
# out of the set of pull requests that should be applied to master.

It's not a big deal, but if you put the right tags in your email
then my filtering will automatically ignore it for me :-)

thanks
-- PMM

