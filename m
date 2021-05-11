Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2CC2F37B059
	for <lists+qemu-devel@lfdr.de>; Tue, 11 May 2021 22:54:11 +0200 (CEST)
Received: from localhost ([::1]:60904 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lgZOM-0001vg-9K
	for lists+qemu-devel@lfdr.de; Tue, 11 May 2021 16:54:10 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:43976)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <wrampazz@redhat.com>)
 id 1lgZN9-0001Gf-Jt
 for qemu-devel@nongnu.org; Tue, 11 May 2021 16:52:55 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:40579)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <wrampazz@redhat.com>)
 id 1lgZN5-0003Un-H0
 for qemu-devel@nongnu.org; Tue, 11 May 2021 16:52:54 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1620766370;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=eVS5A+jYTx7P0NpYENaeWjC2HaJKoxZPTI40+dUIuJ8=;
 b=R7mmmFShs7xMWeJEeXJAG7xyNFw7IRDw8vlmjHhZ4S3f7jofIXzKkBtqiT4bVRJDAluFVx
 ipoCOBdQQe5IBF5r8igyubcb95qhhCrhcFNqewb9oIuWhQMJKYLHEeD8oXszSN1XbcwTpt
 4oNkfkdXlC4okUIXRWsQUXk5YX51Ocw=
Received: from mail-vs1-f71.google.com (mail-vs1-f71.google.com
 [209.85.217.71]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-416-wjqkP-lNNDKXeLxw2QDKfQ-1; Tue, 11 May 2021 16:52:49 -0400
X-MC-Unique: wjqkP-lNNDKXeLxw2QDKfQ-1
Received: by mail-vs1-f71.google.com with SMTP id
 x22-20020a67c0960000b02902259994ab39so10203527vsi.0
 for <qemu-devel@nongnu.org>; Tue, 11 May 2021 13:52:49 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=eVS5A+jYTx7P0NpYENaeWjC2HaJKoxZPTI40+dUIuJ8=;
 b=lRS1ZNZK3sTPvn4NujUjLNV8dGKbGLSJGO/AfZVn1z9ndeeRfbiVoOvIMCH8JQqzM6
 e2t+7w1gAXDX6aXgfxgASgEIPtn8bDVG9otHxF3KfLmUdenlE4nym5uMgtVim7J4l0q+
 2c2+I+2j2Ye7p2Gh0lTaZ3vOJtwQ36fyx5SzWXy7LI3mrAe5m2weBeW4zyRetwooXUon
 o2bUx5prsrLFLYd09n5iXwkpeRHDuEZgItuFp07Gf6FjaRwT6kBATKTH38AL8FexZPQk
 5dFq7DvCI3jXSyq9J2dbtJ5tW563+bQ1TxEvNbDKbg0JdDNhQuaSzSWjzANfeOPuIABF
 Xq9A==
X-Gm-Message-State: AOAM530V2gAZGdTucMACQ7GORboQm+MNAiuW61uvPkeC0cAynx49MYuW
 JHIQCtHza+M0rAX3Ht1tcqA/2RUXb7kBBQEdfHJNI39/SfIzhhrGi366pczMirl/wEe2PYeTfzp
 IsCyUp5g0Uc9vN+b85qStN++Dyha0ONg=
X-Received: by 2002:a05:6102:149:: with SMTP id
 a9mr13640946vsr.1.1620766368750; 
 Tue, 11 May 2021 13:52:48 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJyzvA0pDnDluWEb+0YtNFU4wp3ka70Hkp6hB/hAp+HRoy0+rWST+KJGSMmVGXJXzkpXnhEOdWxHhoBQCyTovSw=
X-Received: by 2002:a05:6102:149:: with SMTP id
 a9mr13640938vsr.1.1620766368609; 
 Tue, 11 May 2021 13:52:48 -0700 (PDT)
MIME-Version: 1.0
References: <20210511132641.1022161-1-berrange@redhat.com>
 <20210511132641.1022161-10-berrange@redhat.com>
In-Reply-To: <20210511132641.1022161-10-berrange@redhat.com>
From: Willian Rampazzo <wrampazz@redhat.com>
Date: Tue, 11 May 2021 17:52:22 -0300
Message-ID: <CAKJDGDaZ84QTcHaPtq2bYSCWb53GsQAGAVzf_Yg=aAS+o=v_PQ@mail.gmail.com>
Subject: Re: [PATCH 09/12] tests/docker: drop CentOS 7 container
To: =?UTF-8?Q?Daniel_P=2E_Berrang=C3=A9?= <berrange@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=wrampazz@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=170.10.133.124; envelope-from=wrampazz@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.699,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: Thomas Huth <thuth@redhat.com>, Stefan Weil <sw@weilnetz.de>,
 qemu-devel <qemu-devel@nongnu.org>,
 Wainer dos Santos Moschetta <wainersm@redhat.com>,
 =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <f4bug@amsat.org>,
 =?UTF-8?B?QWxleCBCZW5uw6ll?= <alex.bennee@linaro.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Tue, May 11, 2021 at 10:28 AM Daniel P. Berrang=C3=A9 <berrange@redhat.c=
om> wrote:
>
> It has been over two years since RHEL-8 was released, and thus per the
> platform build policy, we no longer need to support RHEL-7 as a build
> target.
>
> Signed-off-by: Daniel P. Berrang=C3=A9 <berrange@redhat.com>
> ---
>  .gitlab-ci.d/containers.yml             |  5 ---
>  tests/docker/dockerfiles/centos7.docker | 43 -------------------------
>  2 files changed, 48 deletions(-)
>  delete mode 100644 tests/docker/dockerfiles/centos7.docker
>

Reviewed-by: Willian Rampazzo <willianr@redhat.com>


