Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 767A2660F81
	for <lists+qemu-devel@lfdr.de>; Sat,  7 Jan 2023 15:27:05 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pEA8e-0008SN-Kg; Sat, 07 Jan 2023 09:25:36 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1pEA8c-0008S6-31
 for qemu-devel@nongnu.org; Sat, 07 Jan 2023 09:25:34 -0500
Received: from mail-pl1-x62b.google.com ([2607:f8b0:4864:20::62b])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1pEA8a-0004Wb-B6
 for qemu-devel@nongnu.org; Sat, 07 Jan 2023 09:25:33 -0500
Received: by mail-pl1-x62b.google.com with SMTP id d15so4696761pls.6
 for <qemu-devel@nongnu.org>; Sat, 07 Jan 2023 06:25:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=kHLBU0tZRRWek7iNN1HoBVz6nx+2aesHqYzsoDm/RFk=;
 b=Zh7peIwit2TqfBt+qD08VYQarsisSp1AnkvDNP72IuUF078GcEJDWpYuPB9uMTgNKO
 ngAelryJxEl9CQyb/L5Gh+DGUaT3NlOdnP3d4xGltpeilykImFdF3yMOsl9evTGxxCbH
 Ngd3PvEXOgU6sxOBxqXHgT6JwKIEIT6NEDXGjrU9sxzC7IRy1LOuyLimQt4s7jE8ntTj
 LHMbGJQVHYhFi0nPFsefjgHZyXEcwVQJD3zN5AFfnVeCs8pBon/b+XEMjqTpMenegoG/
 Z2RN3+masOqW/i1Fl+KCmw6nHzhjtr6XM+AvVjpjcMO2kJUqdPN1+k6L3DNm8DIN1i+w
 Jg0g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=kHLBU0tZRRWek7iNN1HoBVz6nx+2aesHqYzsoDm/RFk=;
 b=H5N27Wod6t+UtWosV97UUBJ/iQOwp5Yk0/RGNcWWMrYEAe247UAGVAqv+xdNPwZB1K
 SJ7uLvvU77VcyD5uMGB6c11VzELi84tY62mcsSunW/hOyeyha4a+eVtq+4NiNPfrjAwD
 riBFh8i0bdoZ59ieHDYTzae9cr0phXsfwBYKnPehh6vK5c6U/qczb3RU/cwPl4ZngTXn
 jzCLzxhFgttBxc+KZ/ng9LCanPVkyMYjdZJGK+qdObgzryFhD1LYP+FxjKrGOyOzFbDh
 oCENIg1kPup2nJ39HKR8iXLctrWj8AiAbkPaFIVxbGIEtJhOfTicHiAYplqVlG8pE8MT
 g0Zw==
X-Gm-Message-State: AFqh2ko5CQhmmIAat2OZCHgYYIetUWatIrnmhGPWJ05y16SLhU64CDtd
 vPc3x6eH0MJrCrr1gUS0l5j7LBgFPn2QyAbr8c6KsA==
X-Google-Smtp-Source: AMrXdXtwQu+MxmCtsQvTOTEpzLINHk5LdbfwRWqUx4vuHnBFdwWdPCHj1IGsgZmVMtb1VXt7753nE24hTnTpI+YtZ9c=
X-Received: by 2002:a17:902:9890:b0:189:b0a3:cf4a with SMTP id
 s16-20020a170902989000b00189b0a3cf4amr2704942plp.60.1673101530650; Sat, 07
 Jan 2023 06:25:30 -0800 (PST)
MIME-Version: 1.0
References: <20230106082853.31787-1-thuth@redhat.com>
In-Reply-To: <20230106082853.31787-1-thuth@redhat.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Sat, 7 Jan 2023 14:25:19 +0000
Message-ID: <CAFEAcA_0hWNJWhmjW=yjSVgy1HK4c-_G3DBNPUpbj5KKpjjqeA@mail.gmail.com>
Subject: Re: [PULL 00/15] First batch of s390x, qtests and misc fixes in 2023
To: Thomas Huth <thuth@redhat.com>
Cc: qemu-devel@nongnu.org, Nikita Ivanov <nivanov@cloudlinux.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::62b;
 envelope-from=peter.maydell@linaro.org; helo=mail-pl1-x62b.google.com
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

On Fri, 6 Jan 2023 at 08:29, Thomas Huth <thuth@redhat.com> wrote:
>
>  Hi Peter!
>
> The following changes since commit cb9c6a8e5ad6a1f0ce164d352e3102df46986e22:
>
>   .gitlab-ci.d/windows: Work-around timeout and OpenGL problems of the MSYS2 jobs (2023-01-04 18:58:33 +0000)
>
> are available in the Git repository at:
>
>   https://gitlab.com/thuth/qemu.git tags/pull-request-2023-01-06
>
> for you to fetch changes up to 975f619662a46cb5dc7a3b17b84a1b540fb7df5c:
>
>   .gitlab-ci.d/windows: Do not run the qtests in the msys2-32bit job (2023-01-05 21:50:21 +0100)
>
> ----------------------------------------------------------------
> * s390x header clean-ups from Philippe
> * Rework and improvements of the EINTR handling by Nikita
> * Deprecate the -no-hpet command line option
> * Disable the qtests in the 32-bit Windows CI job again
> * Some other misc fixes here and there

Hi -- this produces new warnings during 'make check' on the bios-tables-test:

qemu-system-i386: -no-hpet: warning: -no-hpet is deprecated, use
'-machine hpet=off' instead

If we're deprecating that option, can we update the test suite
to not use it, please ?

thanks
-- PMM

