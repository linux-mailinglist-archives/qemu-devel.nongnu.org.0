Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8654C672248
	for <lists+qemu-devel@lfdr.de>; Wed, 18 Jan 2023 17:00:13 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pIAqq-0006VN-Sy; Wed, 18 Jan 2023 10:59:48 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@gmail.com>)
 id 1pIAqn-0006VD-Ec
 for qemu-devel@nongnu.org; Wed, 18 Jan 2023 10:59:45 -0500
Received: from mail-yb1-xb36.google.com ([2607:f8b0:4864:20::b36])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <stefanha@gmail.com>)
 id 1pIAqk-0000h8-Pt
 for qemu-devel@nongnu.org; Wed, 18 Jan 2023 10:59:44 -0500
Received: by mail-yb1-xb36.google.com with SMTP id e202so15254631ybh.11
 for <qemu-devel@nongnu.org>; Wed, 18 Jan 2023 07:59:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=HNIuzBbmfJiba+TQQy2P1Uiwnz+w92eoi9av9goU/bA=;
 b=SRCA1b20ixAcPSUMl6vr/y9fQ30Gl9SQgj5CD5Tj0E9QQCowk/LOUAfxMJKl9evjqd
 PmDDrEyOfDYD2+sInTjrxUfw6iY7mI04DFhbCt5ql2pAp8DIPV8LXoFUAZS8qy4miJuu
 Au8DNOYZCgwmEIyS9c0M8bJTZA8FDqCZ8ViwX2WnklZyF/tL56UKbQ9IebSHitphocZO
 5tz+uWk/TdkhQAM8tQw94662DxAOcGdjLaQ40jgLUamTEq0sfEi5wj/vIers70DxmqBw
 P24yvQQFtHXGIo+xE0oLcE26zMml1RA2iew+P1hi7VQRZtjTlv3hHJrpVTAfgGac/56g
 WBrQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=HNIuzBbmfJiba+TQQy2P1Uiwnz+w92eoi9av9goU/bA=;
 b=pXeVyaTI0w74rkDFK25IBmWOMwlMCI4oaJ767cCNNPmKiUDC0tB880DOFpaa7lOLD1
 hN9GK41iD+3IPdbNubdOFgJY5EydwHnZPYKGLfRjSPSytT7pJiE1+RJbPwamSfSA4ETP
 wAB4hWaLF9p2kNH0ypI3KIOx4M0D+wrrhEeMTkJXbYQ8CdumI77957R+9Ay2ZjPYPcAN
 ZCOIfNRehctDUD09vgNFeFalizuUjC1aVDomWg802oIqbfgFu+QwrlWM+Qq/a+fBY+h7
 rrXuVwDjhI4IRXEKrfOF7LvKUXnyDjTWF08ypux3euGUbCyhX3L55DTc3QxwUB1QAXze
 26rQ==
X-Gm-Message-State: AFqh2krNgdXy7l+fuaIKFvk8pp8K2IKOSDOBnYSJ709CSxfC9ylRdl4H
 /R/hyUM9KKUohkAoT5L4GGRg8kCG8/FdlklketM=
X-Google-Smtp-Source: AMrXdXuvaZmr/6Kg4yB85cfC7a2PlNqEHmuCkndrsq9U+sBo/MAR56HNRrJR4EI+41yvSAnAue7EKnx9+kbWpj4Dw6c=
X-Received: by 2002:a25:bc92:0:b0:7b4:db9a:48ae with SMTP id
 e18-20020a25bc92000000b007b4db9a48aemr638807ybk.207.1674057581707; Wed, 18
 Jan 2023 07:59:41 -0800 (PST)
MIME-Version: 1.0
References: <20230118153833.102731-1-dgilbert@redhat.com>
In-Reply-To: <20230118153833.102731-1-dgilbert@redhat.com>
From: Stefan Hajnoczi <stefanha@gmail.com>
Date: Wed, 18 Jan 2023 10:59:30 -0500
Message-ID: <CAJSP0QU+o-R6ZKN8R1MHoUqFwfsQmpKt6KP5hqhyFrK5HJti6w@mail.gmail.com>
Subject: Re: [PATCH 0/3] Remove C virtiofsd
To: "Dr. David Alan Gilbert (git)" <dgilbert@redhat.com>,
 Cleber Rosa <crosa@redhat.com>
Cc: qemu-devel@nongnu.org, stefanha@redhat.com, vgoyal@redhat.com, 
 hczenczek@redhat.com, gmaglione@redhat.com, virtio-fs@redhat.com, 
 pbonzini@redhat.com, alex.bennee@linaro.org
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::b36;
 envelope-from=stefanha@gmail.com; helo=mail-yb1-xb36.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
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

On Wed, 18 Jan 2023 at 10:40, Dr. David Alan Gilbert (git)
<dgilbert@redhat.com> wrote:
>
> From: "Dr. David Alan Gilbert" <dgilbert@redhat.com>
>
> We deprecated the C virtiofsd in commit 34deee7b6a1418f3d62a
> in v7.0 in favour of the Rust implementation at
>
>   https://gitlab.com/virtio-fs/virtiofsd
>
> since then, the Rust version has had more development and
> has held up well.  It's time to say goodbye to the C version
> that got us going.
>
> The only thing I've not cleaned up here is
>   tests/avocado/virtiofs_submounts.py
>
> which I guess needs to figure out where the virtiofsd implementation
> is and use it; suggestions welcome.

I see something similar in tests/avocado/avocado_qemu/__init__.py:

        # If qemu-img has been built, use it, otherwise the system wide one
        # will be used.  If none is available, the test will cancel.
        qemu_img = os.path.join(BUILD_DIR, 'qemu-img')
        if not os.path.exists(qemu_img):
            qemu_img = find_command('qemu-img', False)
        if qemu_img is False:
            self.cancel('Could not find "qemu-img", which is required to '
                        'create the bootable image')

Maybe find_command('virtiofsd', False)?

Stefan

