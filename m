Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8192734FF6E
	for <lists+qemu-devel@lfdr.de>; Wed, 31 Mar 2021 13:26:40 +0200 (CEST)
Received: from localhost ([::1]:38550 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lRYzf-0003Sh-KX
	for lists+qemu-devel@lfdr.de; Wed, 31 Mar 2021 07:26:39 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:45272)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1lRYyt-00032Y-Gf
 for qemu-devel@nongnu.org; Wed, 31 Mar 2021 07:25:51 -0400
Received: from mail-wr1-x42b.google.com ([2a00:1450:4864:20::42b]:33744)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1lRYyr-0006Ea-QY
 for qemu-devel@nongnu.org; Wed, 31 Mar 2021 07:25:51 -0400
Received: by mail-wr1-x42b.google.com with SMTP id o16so19346272wrn.0
 for <qemu-devel@nongnu.org>; Wed, 31 Mar 2021 04:25:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=references:user-agent:from:to:cc:subject:date:in-reply-to
 :message-id:mime-version:content-transfer-encoding;
 bh=2oc4L37YVDlF6ucmserJ6GhjNV895Q9Rxi1s6C74IbM=;
 b=GbfeJJ/csbqRtp5VvvyDdDZ8su75w/fhMVRmV8soF0G7gNCelxZGf94nYxUAuPdP9u
 PEEp6Sa3Cmh65+XSjce0ECfmYLgx+LNWRLaun2vMaM7E4o45UIn+Qcwd78xz/ijlleh0
 wvBy3HXZHMlUVjAnxWC531uJRfIbim6G7hPpCA5k9kBbj8cjsXnlSueHBV6XvRLCL9ZU
 IuGmSRr8ibwq+Ph5ds4240yQoN3jQhjyyNKDaBnzZLQaTdCxGQPz6hMFzauYEv97K99e
 62jqep4qii3G3ffeHZyD6/gN1eYpp5QWA3srEiah8vfPdHY2g6ML1MT6xrXwPH6bYkHR
 S3vg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:references:user-agent:from:to:cc:subject:date
 :in-reply-to:message-id:mime-version:content-transfer-encoding;
 bh=2oc4L37YVDlF6ucmserJ6GhjNV895Q9Rxi1s6C74IbM=;
 b=nzExi2S1/A9kjmS9UoysOe0Qt560iFrn/oqewJDII6Ii+wXDZaK3DcBQ1FFWYX8JIR
 QoRYOzTVTuwclPJAPOXSptUCFc6xLX6EolJsAF9fxbdjnwu7efNdiE45RaSL0xIxCgg5
 XE6L/ASngQOTeVGE/LZXDAAIgPpx03x8Se9z9gg7Izi7GNdzuXc3VqQmFP+1QYGzz6WT
 95uUWYOUEnUw7kejLWf2//Lz98YmLwlSqdM4eRCItvSMS93eGG0i9hxJMvpCnxLMsoah
 nL6mnkpGc8LkTpaf6luC9F8x9usw9DTxGA3V8RYrAUN3ZdYBoqLs63QMctgVRkSsbIXf
 E6ag==
X-Gm-Message-State: AOAM532/N8nVwozC/0OzK1COjhlJNdUonsvSNLwDnHhFGa/T6k7jpaV9
 8OvlVgrWSpyh5q63IrfJQ3hCSw==
X-Google-Smtp-Source: ABdhPJyXUjy9tC4CBSL192HgbMx9x43/LdMHIRCQOn6ab3OVe33eykzf4kNC7TR4gYD+lrpa/q8V0w==
X-Received: by 2002:a05:6000:1acb:: with SMTP id
 i11mr3219089wry.68.1617189948178; 
 Wed, 31 Mar 2021 04:25:48 -0700 (PDT)
Received: from zen.linaroharston ([51.148.130.216])
 by smtp.gmail.com with ESMTPSA id m11sm3830718wri.44.2021.03.31.04.25.47
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 31 Mar 2021 04:25:47 -0700 (PDT)
Received: from zen (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id A7D441FF7E;
 Wed, 31 Mar 2021 12:25:46 +0100 (BST)
References: <20210325175023.13838-1-peter.maydell@linaro.org>
User-agent: mu4e 1.5.11; emacs 28.0.50
From: Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
To: Peter Maydell <peter.maydell@linaro.org>
Subject: Re: [PATCH for-6.0 0/2] document gdbstub debugging of multicore
 machines
Date: Wed, 31 Mar 2021 12:25:40 +0100
In-reply-to: <20210325175023.13838-1-peter.maydell@linaro.org>
Message-ID: <87sg4bo98l.fsf@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::42b;
 envelope-from=alex.bennee@linaro.org; helo=mail-wr1-x42b.google.com
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
Cc: Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
 qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


Peter Maydell <peter.maydell@linaro.org> writes:

> The way gdb and our gdbstub handle multicore and multicluster
> machines is not very obvious.  This patchset adds some documentation
> of how to do it. In particular it gives the necessary runes
> for how to get gdb to work with machines which have multiple
> clusters of heterogenous CPUs (that's the sifive_u board, some
> of the MPS2/MPS3 boards, and the Xilinx one).
>
> I don't think there's any way for the stub to tell gdb
> "I have 2 inferiors, attach to both of them", unfortunately,
> so the user has to manually connect to them. (We should talk
> to the gdb folks to confirm that and perhaps suggest protocol
> enhancements. For 6.0, at least let's document the current state
> of affairs.)

Queued to for-6.0/fixes-for-rc2, thanks.

--=20
Alex Benn=C3=A9e

