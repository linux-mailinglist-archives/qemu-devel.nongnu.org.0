Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4898A6CD9DC
	for <lists+qemu-devel@lfdr.de>; Wed, 29 Mar 2023 15:03:17 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1phVR2-0004UX-8Y; Wed, 29 Mar 2023 09:01:52 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1phVQt-0004Sj-P8
 for qemu-devel@nongnu.org; Wed, 29 Mar 2023 09:01:44 -0400
Received: from mail-ed1-x532.google.com ([2a00:1450:4864:20::532])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1phVQr-00060Q-VL
 for qemu-devel@nongnu.org; Wed, 29 Mar 2023 09:01:43 -0400
Received: by mail-ed1-x532.google.com with SMTP id i5so63144953eda.0
 for <qemu-devel@nongnu.org>; Wed, 29 Mar 2023 06:01:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1680094900;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=iUQwAljUL4hdH6yr+nNXbzvhLbExE141MtzbfAWtG8g=;
 b=D7On/o9yoB8hOqpZXe0yGbkI5VBCQjZtSHuhhTp7WRsK3e3Tnqj3vdi211+b5yYqa6
 abnKCrOaiSCvXXmIbZr43K/6bGwPmvRXYI5WqYcx/CzkwH3H4BPDkMEfHi0a7p4kGMwh
 SASo66nFe+fXBrLOa27+g8WTiU+F5oz5eXMPEZY44/WS7ERZ6jugp5BGW7B6EMeNXI8f
 /p0d8OPvZM5YrCLt37COrToATLMQUxRqKE+dHJvhqoYctbZJI+JldTBti4ScP+uRkDTX
 DxoeOQv/8sMzUaEMtnl214UZZyHr1iarYtmP8XgK1btHWMLCqUhuriVNDx2rsmYMM4iq
 kXpA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1680094900;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=iUQwAljUL4hdH6yr+nNXbzvhLbExE141MtzbfAWtG8g=;
 b=keAepkz9No4Gz3Zi5kj3enpbTroSiaqHhVMAIlsUMrkk33C6+FYQGkYPHCxuvcHlIe
 7sJBXHlmmMhDWf1rRAPyYS+EKvdCRUAzqajKDsQFFNQLc5it29oa4YMZij+YHrVYXKti
 CNxjKmKCNqOoQUYJBns4hICUlBqlMhXsSaQSyup90WhG9r1z3ZweD6iDpHiDSJQJfHfJ
 e2tQCb44zP43uSR23McYw+FfmejxfMCVDBPkols8jpWj7HtItgPPELIUwoJA/eu3efsc
 j2+JdYfRhWbXrf9+Y8Dxa0T1/oVbgsdrryDw3drQfFeZik6y2nWmziIV9L2H+G5lOB4Q
 PIRg==
X-Gm-Message-State: AAQBX9cRNmITdY7A/N+OVrlzk5IJH+aaGbTYc3pH2BY+Vb5UtwS0un6V
 F+kNfy4NAzMZ+eRisVoGGVo1uGwfd+c9Xs5skJvEIw==
X-Google-Smtp-Source: AKy350ZOe5zjYT2UCOUpu+16b377IvJem3YXxurk34vlg8bG20mR+VBYER/SyAXf3CuNScdrNBsCNDXS04WNBb33p/Y=
X-Received: by 2002:a17:906:988e:b0:878:4a24:1a5c with SMTP id
 zc14-20020a170906988e00b008784a241a5cmr8588625ejb.6.1680094900536; Wed, 29
 Mar 2023 06:01:40 -0700 (PDT)
MIME-Version: 1.0
References: <20230328225806.2278728-1-richard.henderson@linaro.org>
In-Reply-To: <20230328225806.2278728-1-richard.henderson@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Wed, 29 Mar 2023 14:01:29 +0100
Message-ID: <CAFEAcA-Wh_PFQFNEhM-GFz=woQW92TDiWd4Z3YTEW34f5T76qA@mail.gmail.com>
Subject: Re: [PULL 00/15] tcg patch queue
To: Richard Henderson <richard.henderson@linaro.org>
Cc: qemu-devel@nongnu.org
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::532;
 envelope-from=peter.maydell@linaro.org; helo=mail-ed1-x532.google.com
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

On Tue, 28 Mar 2023 at 23:58, Richard Henderson
<richard.henderson@linaro.org> wrote:
>
> The following changes since commit d37158bb2425e7ebffb167d611be01f1e9e6c86f:
>
>   Update version for v8.0.0-rc2 release (2023-03-28 20:43:21 +0100)
>
> are available in the Git repository at:
>
>   https://gitlab.com/rth7680/qemu.git tags/pull-tcg-20230328
>
> for you to fetch changes up to 87e303de70f93bf700f58412fb9b2c3ec918c4b5:
>
>   softmmu: Restore use of CPU watchpoint for all accelerators (2023-03-28 15:24:06 -0700)
>
> ----------------------------------------------------------------
> Use a local version of GTree [#285]
> Fix page_set_flags vs the last page of the address space [#1528]
> Re-enable gdbstub breakpoints under KVM
>


Applied, thanks.

Please update the changelog at https://wiki.qemu.org/ChangeLog/8.0
for any user-visible changes.

-- PMM

