Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id ED7172F4D36
	for <lists+qemu-devel@lfdr.de>; Wed, 13 Jan 2021 15:36:35 +0100 (CET)
Received: from localhost ([::1]:33444 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kzhGE-0001JK-Vo
	for lists+qemu-devel@lfdr.de; Wed, 13 Jan 2021 09:36:35 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:51494)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1kzgzO-0006TM-9h
 for qemu-devel@nongnu.org; Wed, 13 Jan 2021 09:19:10 -0500
Received: from mail-ej1-x630.google.com ([2a00:1450:4864:20::630]:33794)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1kzgzM-0000aZ-3m
 for qemu-devel@nongnu.org; Wed, 13 Jan 2021 09:19:09 -0500
Received: by mail-ej1-x630.google.com with SMTP id hs11so971173ejc.1
 for <qemu-devel@nongnu.org>; Wed, 13 Jan 2021 06:19:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=4ba04nNMTsC5ftrLqyU3H6IlZep1iCyrhQrz+n8zN9s=;
 b=XOsvBm9cpd+x0jD27MgMRA1cSKS25F7KuqMrglhtjykOq1RJxtEzHdAXi0KA878fYw
 z65tiql6k4Ao0NaEE47kX3YYLFSHAVVvoQ54KtKQ5pfTl1OKTHCbOn0SNOLaCrLu4rPv
 7cofrHjRceMpIlP2sDbMq0PWB505IUAvnUuRIg9qdws/pZNXrwIrhed7PAgKzwkxv3dC
 XfyirhH3gKhiR6v7D8gFRbYU1yeLSOCBCIoV4v1BKAyDCNBPHvJtZM2NiQEMgUFMOB+9
 fJyWsOEh1pK28KB1bLogLj1xm28pXmEfKWyvFW2KfwvjnVWfyKzjiftuRCoTIGD9rFek
 gHAQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=4ba04nNMTsC5ftrLqyU3H6IlZep1iCyrhQrz+n8zN9s=;
 b=T/COu2R6tz8Aep8PoKDPkqvH/zZdmQUtTMbwdcSyU9j9GgAseAC7euD0apx1yZs9jZ
 On4vg4HggRxVlg4R34SfNr5r8kg5Zr7QfKiDVlHCW8ePtAKIh1PUO+XzVilDsgJ+aFA8
 GR1yE+nF1w1Tp7WpzzRipNjZHKvw5kgtXE+zYGb2NKfcs6H8AJd/H+IQ8llJUQg0ckLX
 MDOCCC3ulhGfw6Orry6O0ye3WazWxnG26T5LfuTOib7K1ikBVKLcVBc7I4L6RzcaS595
 43G9BkUsl2InhStJNHz3Cv1odqYagCzAwAEwJ88vfwBmk4kaSH/okotf2XZrFepp5xMD
 7ndQ==
X-Gm-Message-State: AOAM531llZRZtwqoq2XuWUO8TPGhEZbQZmhjf/LNuPxyfEW9GtJBJRsp
 edGoW82/96/+qHMMU2v7/PYaHXEWhGZTIr1g0ItUhg==
X-Google-Smtp-Source: ABdhPJx3cHkwsGopU5fsAHgrDoLYfb690Yc28TJGXzoF9YHB4+XbkliI3+zcacMLqWQVViU6tt3fOAPOacqf/Tu6+9Y=
X-Received: by 2002:a17:906:31d2:: with SMTP id
 f18mr1672555ejf.407.1610547545580; 
 Wed, 13 Jan 2021 06:19:05 -0800 (PST)
MIME-Version: 1.0
References: <20210112171450.791427-1-pbonzini@redhat.com>
In-Reply-To: <20210112171450.791427-1-pbonzini@redhat.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Wed, 13 Jan 2021 14:18:54 +0000
Message-ID: <CAFEAcA_Y58k69WwUHi2vcX7hxtfM+yMYq4XqBuYAkQ3iM8R7Xg@mail.gmail.com>
Subject: Re: [PULL 00/20] Misc patches for 2021-01-12
To: Paolo Bonzini <pbonzini@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::630;
 envelope-from=peter.maydell@linaro.org; helo=mail-ej1-x630.google.com
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
Cc: QEMU Developers <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Tue, 12 Jan 2021 at 17:28, Paolo Bonzini <pbonzini@redhat.com> wrote:
>
> The following changes since commit b3f846c59d8405bb87c551187721fc92ff2f1b92:
>
>   Merge remote-tracking branch 'remotes/huth-gitlab/tags/pull-request-2021-01-11v2' into staging (2021-01-11 15:15:35 +0000)
>
> are available in the Git repository at:
>
>   https://gitlab.com/bonzini/qemu.git tags/for-upstream
>
> for you to fetch changes up to c117e5b11a21598205f1701a15965e825959d59f:
>
>   target/i386: Use X86Seg enum for segment registers (2021-01-12 17:05:10 +0100)
>
> ----------------------------------------------------------------
> * UI configury cleanups and Meson conversion
> * scripts/gdb improvements
> * WHPX cleanups and fixes
> * cirrus win32 CI improvements
> * meson gnutls workaround
>


Applied, thanks.

Please update the changelog at https://wiki.qemu.org/ChangeLog/6.0
for any user-visible changes.

-- PMM

