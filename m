Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 625B3389731
	for <lists+qemu-devel@lfdr.de>; Wed, 19 May 2021 22:01:41 +0200 (CEST)
Received: from localhost ([::1]:59462 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ljSNw-00081k-20
	for lists+qemu-devel@lfdr.de; Wed, 19 May 2021 16:01:40 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:49292)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1ljSMr-0007Br-7j
 for qemu-devel@nongnu.org; Wed, 19 May 2021 16:00:33 -0400
Received: from mail-ed1-x52e.google.com ([2a00:1450:4864:20::52e]:36406)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1ljSMp-00067D-BS
 for qemu-devel@nongnu.org; Wed, 19 May 2021 16:00:32 -0400
Received: by mail-ed1-x52e.google.com with SMTP id df21so16758712edb.3
 for <qemu-devel@nongnu.org>; Wed, 19 May 2021 13:00:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=cgzdPP+TYqRR5KH38CPhGyIWQrutrajGW3QnGKiiACE=;
 b=ROdBC9gPbzvtnXOFkYBxy8dYGWoHd5cEu3b4PQsifX9Eb/VgOXVWJjysklg/flFiqQ
 NsPUhGVQQKELbU8ADI5K/2ZEMDeGxc2Ufa7/ky6PPZo0wkJ2dBYKZmSa1dqgCXnLCqEL
 aoRVZzUdDjKeEkwIY5Rs9mPqts+7lCLawNxfBUf62b7FchA7JoiIb6bvFQgnMGXdreUH
 9NoNSNUAKsemkHjRhb6UWIfI/9ZTkgRZKFF69D7X7jyRc3nnVMIRnZRS2BIWXYzdQh9K
 S790I/gpx6PZTQXejNKElwvDeU0pPTm0zH5antx9ANa59v+g0ZD0jrzHn3s/GTDnMcKg
 LbiA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=cgzdPP+TYqRR5KH38CPhGyIWQrutrajGW3QnGKiiACE=;
 b=rHKq/WQkCHXrD/Ez0feaARWzf0LeJUVlqSRDF8y/Gih3OS1bokI1ybs36BjnkhQMzs
 U0lYRxfDoEPM1vi8KcJDpLrjXigIn9nCMmb0GABmZetKFdTXE8ltJu8nCg1SSmWq6XrJ
 +Jgz78cKKxdmxo9v5R9lEcmi7NRiKBLrTZCr2Rel7SJzeuFYAqtm9qZecUmwfjMwX60c
 7jz+EHW2PxOzW/pNY/HUNYP5lQGRFKfwMANqduYzwd/HAMn3bU+rcPYTMUEnxmdKV0UO
 UGLV7NalrzocSzDTu2gCOQw6NLJfpa21aye2KjFLPnt5MzPxOwWtUB0hixmcAYxpCik9
 v3cQ==
X-Gm-Message-State: AOAM533uucOZAoTiKYBXgrx5/UanR18TPIdHryaGGkSDQi1m6vzKfXhx
 sPSBhR/S8Gune7T/F/vAjLlSwxbUQqt5k8a/YUF5cA==
X-Google-Smtp-Source: ABdhPJyw8hgkGKagGa8m+Wk4nhcbPDE0+0ffEClWCasgotwfHUBL65NO7cSokhiemGs34IoTOBVf8ZTOsCMLRmnmd/Y=
X-Received: by 2002:a05:6402:416:: with SMTP id
 q22mr816000edv.204.1621454429526; 
 Wed, 19 May 2021 13:00:29 -0700 (PDT)
MIME-Version: 1.0
References: <20210518113028.53779-1-kwolf@redhat.com>
In-Reply-To: <20210518113028.53779-1-kwolf@redhat.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Wed, 19 May 2021 21:00:11 +0100
Message-ID: <CAFEAcA9_Yf28HjZtQ8qFdhv-QLctytwt1yF2VoowX3SrC41o5g@mail.gmail.com>
Subject: Re: [PULL v2 00/13] Block layer patches
To: Kevin Wolf <kwolf@redhat.com>
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
Cc: QEMU Developers <qemu-devel@nongnu.org>, Qemu-block <qemu-block@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Tue, 18 May 2021 at 12:32, Kevin Wolf <kwolf@redhat.com> wrote:
>
> The following changes since commit 367196caa07ac31443bc360145cc10fbef4fdf92:
>
>   Merge remote-tracking branch 'remotes/vivier2/tags/trivial-branch-for-6.1-pull-request' into staging (2021-05-17 16:44:47 +0100)
>
> are available in the Git repository at:
>
>   git://repo.or.cz/qemu/kevin.git tags/for-upstream
>
> for you to fetch changes up to c90bd505a3e8210c23d69fecab9ee6f56ec4a161:
>
>   vhost-user-blk: Check that num-queues is supported by backend (2021-05-18 12:57:39 +0200)
>
> ----------------------------------------------------------------
> Block layer patches
>
> - vhost-user-blk: Fix error handling during initialisation
> - Add test cases for the vhost-user-blk export
> - Fix leaked Transaction objects
> - qcow2: Expose dirty bit in 'qemu-img info'
>


Applied, thanks.

Please update the changelog at https://wiki.qemu.org/ChangeLog/6.1
for any user-visible changes.

-- PMM

