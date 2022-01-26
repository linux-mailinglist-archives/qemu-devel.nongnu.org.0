Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E4FC949CD4B
	for <lists+qemu-devel@lfdr.de>; Wed, 26 Jan 2022 16:06:04 +0100 (CET)
Received: from localhost ([::1]:33372 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nCjs4-0002ZT-0X
	for lists+qemu-devel@lfdr.de; Wed, 26 Jan 2022 10:06:04 -0500
Received: from eggs.gnu.org ([209.51.188.92]:33498)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1nCjjf-0000Aq-Cq
 for qemu-devel@nongnu.org; Wed, 26 Jan 2022 09:57:23 -0500
Received: from [2a00:1450:4864:20::32d] (port=37702
 helo=mail-wm1-x32d.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1nCjjc-0005df-TA
 for qemu-devel@nongnu.org; Wed, 26 Jan 2022 09:57:22 -0500
Received: by mail-wm1-x32d.google.com with SMTP id
 l12-20020a7bc34c000000b003467c58cbdfso3916832wmj.2
 for <qemu-devel@nongnu.org>; Wed, 26 Jan 2022 06:57:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=q0sJ7a6j5xvVSDg6rIXfwSX5x16Wvu3orvAMR4Fx/F4=;
 b=M81mkmVA1gFIsYQ9wjfg8L1KshCZBsYGPZhyDOLmmEL1SuUdzGg7T+sPTI6OluwXkd
 IxCFCfj7IhtcUL/VLJOHjJbiFNxEWoimKYZ2YYVMLEk0yKA1qeBjoIjIm/ssU5me0Qn4
 FKp3eFJ1fqDn6X+ERf/SQ16PERL2SMntrD5qecGnAl20Jn2iZY2rgMm0f8bCQczMe06E
 Xcz7wXLGgJnEjuhqgOfwJxKYwXphpW1l1OiAYTtjSPe/eukYU6XtkXZg8SPV3nlauU1Z
 4GlPyWWJTsl+sbkYgP+iF0w79MmUgPZlr58Vu4bLhEi9eEBMEokH+Fc3a2LaBXbDE5+h
 t29w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=q0sJ7a6j5xvVSDg6rIXfwSX5x16Wvu3orvAMR4Fx/F4=;
 b=NHFRpt/BnE3u8NkUREVG2eY4tuU4FwKLmmtd+bG6L059B7w0T5JZKAi2hCWMjdfQ/0
 MOSZplvV+QU7fuakHwDo2T6tDLT+eLFBytwz1zgWBDKqHIe7ku5KTfrk4cI6nJ5hsH1Y
 qM5XqRZOoEjy+gMT4g7XznWEz1OpiOUBam4rZc03bu/JA1SrV+eW+FcWAtUhyH5WfcZG
 x+/o9q18kGdTvN4SmHEGyOTJRp7c19GHEX4dWaFrSZgEXi3+PD+O9ZLg+0Hm4U6LHvHF
 /LshHId5aP/9sIAb3qxtgNYLAcblp32bJnicLwHnySpzLBmvNOR8XUIihOA4z4vSuSzm
 Mbhw==
X-Gm-Message-State: AOAM53174L03H9AC5kJ4Cz2QNBBUyCgpVN/dYOD6aWWj2iF5zFt3w5RC
 65Adpt9Nm9ummA7WBFnw2D0XHzNz+4lMhNXXi3ZIcg==
X-Google-Smtp-Source: ABdhPJxrNbcm+uxvo8AK9Xzm5aMwKVVKpvkUuWpX2OVeNKgSknuFPsy43BuNcisbR5qzqNBls9ITE9MqWjxx/6K3XVk=
X-Received: by 2002:a1c:f70d:: with SMTP id v13mr7658061wmh.133.1643209039193; 
 Wed, 26 Jan 2022 06:57:19 -0800 (PST)
MIME-Version: 1.0
References: <20220126105112.28711-1-dgilbert@redhat.com>
In-Reply-To: <20220126105112.28711-1-dgilbert@redhat.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Wed, 26 Jan 2022 14:57:08 +0000
Message-ID: <CAFEAcA9ok6VY5fS9stb8bUZ-yDbMLSCLCPokKWBtEc3Qif=Y4w@mail.gmail.com>
Subject: Re: [PULL 0/1] virtiofs queue
To: "Dr. David Alan Gilbert (git)" <dgilbert@redhat.com>
Content-Type: text/plain; charset="UTF-8"
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::32d
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::32d;
 envelope-from=peter.maydell@linaro.org; helo=mail-wm1-x32d.google.com
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
Cc: mszeredi@redhat.com, mcascell@redhat.com, slp@redhat.com,
 qemu-devel@nongnu.org, shawtao1125@gmail.com, stefanha@redhat.com,
 pj.pandit@yahoo.co.in, virtio-fs@redhat.com, vgoyal@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Wed, 26 Jan 2022 at 10:54, Dr. David Alan Gilbert (git)
<dgilbert@redhat.com> wrote:
>
> From: "Dr. David Alan Gilbert" <dgilbert@redhat.com>
>
> The following changes since commit aeb0ae95b7f18c66158792641cb6ba0cde5789ab:
>
>   Merge remote-tracking branch 'remotes/jsnow-gitlab/tags/python-pull-request' into staging (2022-01-22 12:03:22 +0000)
>
> are available in the Git repository at:
>
>   https://gitlab.com/dagrh/qemu.git tags/pull-virtiofs-20220126
>
> for you to fetch changes up to 449e8171f96a6a944d1f3b7d3627ae059eae21ca:
>
>   virtiofsd: Drop membership of all supplementary groups (CVE-2022-0358) (2022-01-26 10:32:05 +0000)
>
> ----------------------------------------------------------------
> virtiofsd: Security fix
>
> Fixes: CVE-2022-0358
>
> ----------------------------------------------------------------
> Vivek Goyal (1):
>       virtiofsd: Drop membership of all supplementary groups (CVE-2022-0358)


Applied, thanks.

Please update the changelog at https://wiki.qemu.org/ChangeLog/7.0
for any user-visible changes.

-- PMM

