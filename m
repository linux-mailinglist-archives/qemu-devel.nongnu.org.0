Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4CE2B31FC7D
	for <lists+qemu-devel@lfdr.de>; Fri, 19 Feb 2021 16:59:16 +0100 (CET)
Received: from localhost ([::1]:50716 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lD8BX-0006ZV-B5
	for lists+qemu-devel@lfdr.de; Fri, 19 Feb 2021 10:59:15 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:47708)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <wrampazz@redhat.com>)
 id 1lD7xJ-0006ci-Ee
 for qemu-devel@nongnu.org; Fri, 19 Feb 2021 10:44:33 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:59730)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <wrampazz@redhat.com>)
 id 1lD7xE-00020m-Fo
 for qemu-devel@nongnu.org; Fri, 19 Feb 2021 10:44:32 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1613749466;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=bWqmIuToc+73q+0CDWZNJmjuD6l9bfkpKkp1kD1NzWc=;
 b=Z5y45X8OKf/oGxuR9nfVJC6KO4faPa0xO6fW/EmxPO1yVetDUJxFHTaOKJZNMCmbCL+9dT
 5OWniofQuJW1UlriycBDmAdKiCjGsPCUhzxAxXUs4tPJd3tAYc5ZFj3sbFdW9JWAIp0quW
 AQ22j2Qcg2HzVoX/AwlJTFVAeeChcxA=
Received: from mail-vs1-f71.google.com (mail-vs1-f71.google.com
 [209.85.217.71]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-215-oKaNUOrjOuKlTSEZ1uEGxQ-1; Fri, 19 Feb 2021 10:44:25 -0500
X-MC-Unique: oKaNUOrjOuKlTSEZ1uEGxQ-1
Received: by mail-vs1-f71.google.com with SMTP id b4so353201vsb.22
 for <qemu-devel@nongnu.org>; Fri, 19 Feb 2021 07:44:24 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=bWqmIuToc+73q+0CDWZNJmjuD6l9bfkpKkp1kD1NzWc=;
 b=fx5EAfqFwVf+y2tBHDN7IdnMbRJmijBBYWPuAKBOHxIDY8EL+cRWBICgZcJ4Vwdxqk
 Y0WTE7bnWxMmHletJLTOQWxfsQrjZIlFdmhMcozs2ETssitdtUgFmerETv0TeFoQwgDA
 mYcOxl8WdD9ro7EDvg/3kDoAlXjdWwlsJ0wnxLtXoVQq9cv18ZBbvI5YTo3qutnzdVSS
 2XNgZOtIu7P54YDR3uxdu45y66jphaeiRvdjgGaADEYCfh5jEpfbbbgHz08S/9/5rbfz
 3mhFEnJZgm71m4LibG0fTcxzrAZ9LyCK+8P4HqRFyAktFJVMRg82NB2ywA0krehhLbNp
 /9mw==
X-Gm-Message-State: AOAM533BHADahe/JHfldG5lCeIcgujc2wmp9njijDB7MCfwJoFvCMDPn
 ehtq9i+N3u9I/VRpFjH5763OHc1ztn5amCfyrI8vHiXsKZXyAJOdKKhQLcag+ZTg61qzcDC9rBx
 eBsupic/BKrVGoBVf1PnZE/OwMmCjEyU=
X-Received: by 2002:a67:fa96:: with SMTP id f22mr6786888vsq.45.1613749464448; 
 Fri, 19 Feb 2021 07:44:24 -0800 (PST)
X-Google-Smtp-Source: ABdhPJzHdHnAXhkfJ1JqrZvmEQuma4zqulr6yTdsUaoyMcB/FiKPvVvOcHsaElJNN+AYZuUvnoVOkCFeqmSZKw45d9Y=
X-Received: by 2002:a05:6102:822:: with SMTP id
 k2mr6411344vsb.50.1613749464048; 
 Fri, 19 Feb 2021 07:44:24 -0800 (PST)
MIME-Version: 1.0
References: <161373266228.1608713.7614311331725780044.stgit@pasha-ThinkPad-X280>
In-Reply-To: <161373266228.1608713.7614311331725780044.stgit@pasha-ThinkPad-X280>
From: Willian Rampazzo <wrampazz@redhat.com>
Date: Fri, 19 Feb 2021 12:43:58 -0300
Message-ID: <CAKJDGDY2NQ_EKu=Zf6eCv6PcbtTjv7NAVRT30r=MAzPBUpw9pg@mail.gmail.com>
Subject: Re: [PATCH] tests/acceptance: linux-related tests fix
To: Pavel Dovgalyuk <pavel.dovgalyuk@ispras.ru>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=wrampazz@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=216.205.24.124; envelope-from=wrampazz@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
Cc: =?UTF-8?B?QWxleCBCZW5uw6ll?= <alex.bennee@linaro.org>,
 Paolo Bonzini <pbonzini@redhat.com>,
 Philippe Mathieu Daude <philmd@redhat.com>, qemu-devel <qemu-devel@nongnu.org>,
 Cleber Rosa Junior <crosa@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Fri, Feb 19, 2021 at 8:07 AM Pavel Dovgalyuk
<pavel.dovgalyuk@ispras.ru> wrote:
>
> This patch allows cloudinit images download when ssh
> key is not specified.
>
> Signed-off-by: Pavel Dovgalyuk <Pavel.Dovgalyuk@ispras.ru>
> ---
>  tests/acceptance/avocado_qemu/__init__.py |    6 ++++--
>  1 file changed, 4 insertions(+), 2 deletions(-)
>

Reviewed-by: Willian Rampazzo <willianr@redhat.com>


