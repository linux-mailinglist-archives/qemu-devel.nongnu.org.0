Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6AFE7699AEE
	for <lists+qemu-devel@lfdr.de>; Thu, 16 Feb 2023 18:14:15 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pShni-0001Up-1f; Thu, 16 Feb 2023 12:12:06 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1pShne-0001IF-GO
 for qemu-devel@nongnu.org; Thu, 16 Feb 2023 12:12:02 -0500
Received: from mail-pf1-x42b.google.com ([2607:f8b0:4864:20::42b])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1pShnc-00081C-Hz
 for qemu-devel@nongnu.org; Thu, 16 Feb 2023 12:12:02 -0500
Received: by mail-pf1-x42b.google.com with SMTP id n2so1919241pfo.3
 for <qemu-devel@nongnu.org>; Thu, 16 Feb 2023 09:12:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1676567519;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=YzAymwS/vq96cspJLAbdkQXjwZWoZ6r6exRscq3z8Iw=;
 b=Ddv4w8zeUfQ/XU8yPu4+FEzS9R+8cLFTsblQv0eRUOP4AreRcb4CLbW+NVN/M9Nlsv
 clFe/aUKCsYh1mSDMp055q+zdqfe6H2ujlchjagOB6FmuJOaSoMrLlrTtFnCnBejiK/O
 epo/EyViNDMVrxY3ikNEUh3iXzYn8fe+EwM/LQbtM65I6daETZgpR2sRpyAclCdP06K8
 tNSlmhXJpqLTkQQYXcx4VA148wz8y7U9FKONQ9PeTadqj1+60BFDHVGhcv5vez+OgiKa
 wr6rSQmpt1dm4n5PZBbokUW64DUam8RKTPiuBch0LdA96s2DRLzGVxE7SJlhJyGs6aCq
 9skA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1676567519;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=YzAymwS/vq96cspJLAbdkQXjwZWoZ6r6exRscq3z8Iw=;
 b=0c/9ljMfyx3wqoTv4ysHqDjUuwgPD08vB9AH+U3ry2AtPWsPa0IslX5OCPWv8ncKy+
 uDpzgOVxaSBBFVUowDr+0x1vJHqFAc9cwRWrG5SgwJob4KVLWaTUg++OTYFpgj8DSrjX
 Je9w3vsdLwKMAjDeYZ7p8pvOL4tosfhIWIFK5UpKWQO10yddFYRiRvM6ZkXVDtrQm/i0
 JqYNRY6ukEqFFYSQufII0snfRwzxkXWfWlrHR6PccQJcbq+QwOF+AWa/A26rkbUX48el
 z00OhyNP1Q6Ot4Igkt+uow/a/SJj1NNHdjF6CWIaeDicVmtUjKYOOT/oDqy8ZNLEXuEy
 lTng==
X-Gm-Message-State: AO0yUKXSJ5GYa10KRZruCcV98cJPQDSRPhR8T7fk6hpKT4MERNmBqy3N
 1Vg+uI1kNcd2uSeYcMXpNLTll9afs4UZ0st3qLyHiw==
X-Google-Smtp-Source: AK7set+UuadELnLdEKxEOUQahZ0sNOEWfrVE0H1T6hhrnjUWyFV0XxG92QRkhB0uV/umHkY50nnU3M0hqXS0/M2j36w=
X-Received: by 2002:a62:840e:0:b0:5a9:babe:6cb9 with SMTP id
 k14-20020a62840e000000b005a9babe6cb9mr205667pfd.48.1676567518976; Thu, 16 Feb
 2023 09:11:58 -0800 (PST)
MIME-Version: 1.0
References: <20230215200554.1365-1-quintela@redhat.com>
In-Reply-To: <20230215200554.1365-1-quintela@redhat.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 16 Feb 2023 17:11:47 +0000
Message-ID: <CAFEAcA-f54+Eq2ezp5V9Lu6nC1ha8=X8SNPdZGtfTTcaM+mTyw@mail.gmail.com>
Subject: Re: [PULL 0/5] Migration 20230215 patches
To: Juan Quintela <quintela@redhat.com>
Cc: qemu-devel@nongnu.org, Eric Blake <eblake@redhat.com>,
 qemu-s390x@nongnu.org, 
 Thomas Huth <thuth@redhat.com>, Halil Pasic <pasic@linux.ibm.com>, 
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>, 
 Vladimir Sementsov-Ogievskiy <vsementsov@yandex-team.ru>,
 Alex Williamson <alex.williamson@redhat.com>, 
 Ilya Leoshkevich <iii@linux.ibm.com>, qemu-block@nongnu.org, 
 Stefan Hajnoczi <stefanha@redhat.com>, Fam Zheng <fam@euphon.net>, 
 David Hildenbrand <david@redhat.com>, John Snow <jsnow@redhat.com>, 
 Christian Borntraeger <borntraeger@linux.ibm.com>, 
 Richard Henderson <richard.henderson@linaro.org>,
 Eric Farman <farman@linux.ibm.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::42b;
 envelope-from=peter.maydell@linaro.org; helo=mail-pf1-x42b.google.com
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

On Wed, 15 Feb 2023 at 20:06, Juan Quintela <quintela@redhat.com> wrote:
>
> The following changes since commit 6a50f64ca01d0a7b97f14f069762bfd88160f31e:
>
>   Merge tag 'pull-request-2023-02-14' of https://gitlab.com/thuth/qemu into staging (2023-02-14 14:46:10 +0000)
>
> are available in the Git repository at:
>
>   https://gitlab.com/juan.quintela/qemu.git tags/migration-20230215-pull-request
>
> for you to fetch changes up to 24beea4efe6e6b65fd6248ede936cd3278b2bf8a:
>
>   migration: Rename res_{postcopy,precopy}_only (2023-02-15 20:04:30 +0100)
>
> ----------------------------------------------------------------
> Migration Pull request
>
> This pull request contains:
>
> * Add qemu_file_get_to_fd() a.k.a. make vfio happy(Avihai)
> * migration/block is now DPRINTF() free zone (Philippe)
> * remove res_compat and improve docs (me)
>
> Please apply.


Applied, thanks.

Please update the changelog at https://wiki.qemu.org/ChangeLog/8.0
for any user-visible changes.

-- PMM

