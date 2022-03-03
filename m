Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C60DA4CC04C
	for <lists+qemu-devel@lfdr.de>; Thu,  3 Mar 2022 15:48:41 +0100 (CET)
Received: from localhost ([::1]:37982 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nPmky-0006w8-N2
	for lists+qemu-devel@lfdr.de; Thu, 03 Mar 2022 09:48:40 -0500
Received: from eggs.gnu.org ([209.51.188.92]:36258)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1nPmjC-0005X9-C5
 for qemu-devel@nongnu.org; Thu, 03 Mar 2022 09:46:51 -0500
Received: from [2607:f8b0:4864:20::b31] (port=47024
 helo=mail-yb1-xb31.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1nPmjA-0005C9-KV
 for qemu-devel@nongnu.org; Thu, 03 Mar 2022 09:46:49 -0500
Received: by mail-yb1-xb31.google.com with SMTP id b35so10622473ybi.13
 for <qemu-devel@nongnu.org>; Thu, 03 Mar 2022 06:46:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=vvid7/372vVY4fktR7zLKkW5pp4OGhtaJJcXJ8WEZmw=;
 b=ZsZERJwV760yoXBi59HObQqJyprqeynIIfOeP/nzqUlc/Pg05KZ7OIZDZ7nixtUO25
 /eW21fDpBsOrjZJ/cwqAJieT/Hu75O6PLrBxjiiYLJetPRWb4nJzyGQrCHtjTppYH4wL
 L+IQ8HOnD739QQILgVKiAJwjTg6LhvPLr+oZmapKAkuj75lzs6Y1cReHN0TEob0VOaY4
 q2E4i1edUPgmFrMtfWtW3oLRfLtsvteVQZ5ZDL/NJB0U4EpVMxsNEcml5gQcDqQkWbMy
 Yl4DyVwiiGqcVDeaugTaiIL3o8wEHJmPjPvbdlW8Kgi/068ZcT8p0lxROCxOr7lVWg+R
 y9YA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=vvid7/372vVY4fktR7zLKkW5pp4OGhtaJJcXJ8WEZmw=;
 b=GEH02lHThlQRs2bZMsLUgTgmQRjMdfXlWeyXaFZO9Hw1jeB1h3I03CI2HtyOa3srZe
 MPe7QH0byAtKweQIC55gpOVDnY9W026K0sn+2euJOTRbZhPfCspHqwfpmVjru7/ZIKDE
 v6NrBxl3Z/u0Kc09QhGltyq1SUt6XZNN5azPEA/1cNkxZFTy95OdWBIM2eEF6CVeomTh
 gIdZU8tSFf95LfgGQnhMtPh0x0mbHpgWuYjRrp3gkZKWg5QBPJLkRlFKlP/YOkMXZ0ic
 xyCLPtCisYKDPUFNVvhxhKo3vuWMhOMFFfJJUEBGfcoqBHWxSrYytLVKmc3O6zecNdP2
 wUNQ==
X-Gm-Message-State: AOAM531x7yIhbpbqqKUSUYsCnHsTE/usCKewwAxdRSVTICaXRIa+xyRh
 9RNgi6Ebcx1Xv5pV0MU1xEztAeK03FQqNoOSqnpL8g==
X-Google-Smtp-Source: ABdhPJzrlCD8eLSKwRIgIl2fHkCLyPmLPVaZX0ZLLbWNpZ1lhMcsSNycttOnn3DSXihyur6k6oA58h6VPreCmqpzeT4=
X-Received: by 2002:a05:6902:83:b0:61a:709b:d841 with SMTP id
 h3-20020a056902008300b0061a709bd841mr32728733ybs.140.1646318806960; Thu, 03
 Mar 2022 06:46:46 -0800 (PST)
MIME-Version: 1.0
References: <20220302182936.227719-1-dgilbert@redhat.com>
In-Reply-To: <20220302182936.227719-1-dgilbert@redhat.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 3 Mar 2022 14:46:35 +0000
Message-ID: <CAFEAcA9CrHEu8F7PGGTvsdyLnFJhan9V9FkHDgvapje+_E=hVA@mail.gmail.com>
Subject: Re: [PULL 00/18] migration queue
To: "Dr. David Alan Gilbert (git)" <dgilbert@redhat.com>
Content-Type: text/plain; charset="UTF-8"
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::b31
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::b31;
 envelope-from=peter.maydell@linaro.org; helo=mail-yb1-xb31.google.com
X-Spam_score_int: -6
X-Spam_score: -0.7
X-Spam_bar: /
X-Spam_report: (-0.7 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 PDS_HP_HELO_NORDNS=0.659, RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=no autolearn_force=no
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
Cc: quintela@redhat.com, s.reiter@proxmox.com, qemu-devel@nongnu.org,
 peterx@redhat.com, hreitz@redhat.com, f.ebner@proxmox.com,
 jinpu.wang@ionos.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Wed, 2 Mar 2022 at 18:32, Dr. David Alan Gilbert (git)
<dgilbert@redhat.com> wrote:
>
> From: "Dr. David Alan Gilbert" <dgilbert@redhat.com>
>
> The following changes since commit 64ada298b98a51eb2512607f6e6180cb330c47b1:
>
>   Merge remote-tracking branch 'remotes/legoater/tags/pull-ppc-20220302' into staging (2022-03-02 12:38:46 +0000)
>
> are available in the Git repository at:
>
>   https://gitlab.com/dagrh/qemu.git tags/pull-migration-20220302b
>
> for you to fetch changes up to 18621987027b1800f315fb9e29967e7b5398ef6f:
>
>   migration: Remove load_state_old and minimum_version_id_old (2022-03-02 18:20:45 +0000)
>
> ----------------------------------------------------------------
> Migration/HMP/Virtio pull 2022-03-02
>
> A bit of a mix this time:
>   * Minor fixes from myself, Hanna, and Jack
>   * VNC password rework by Stefan and Fabian
>   * Postcopy changes from Peter X that are
>     the start of a larger series to come
>   * Removing the prehistoic load_state_old
>     code from Peter M
>
> Signed-off-by: Dr. David Alan Gilbert <dgilbert@redhat.com>
>


Applied, thanks.

Please update the changelog at https://wiki.qemu.org/ChangeLog/7.0
for any user-visible changes.

-- PMM

