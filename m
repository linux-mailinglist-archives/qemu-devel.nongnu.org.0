Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id EF53F344D28
	for <lists+qemu-devel@lfdr.de>; Mon, 22 Mar 2021 18:22:31 +0100 (CET)
Received: from localhost ([::1]:40042 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lOOG6-0002sS-UX
	for lists+qemu-devel@lfdr.de; Mon, 22 Mar 2021 13:22:30 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:40136)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1lOOBO-0008My-CC
 for qemu-devel@nongnu.org; Mon, 22 Mar 2021 13:17:38 -0400
Received: from mail-ed1-x536.google.com ([2a00:1450:4864:20::536]:38815)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1lOOBM-0000pH-FH
 for qemu-devel@nongnu.org; Mon, 22 Mar 2021 13:17:37 -0400
Received: by mail-ed1-x536.google.com with SMTP id h13so20302561eds.5
 for <qemu-devel@nongnu.org>; Mon, 22 Mar 2021 10:17:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=references:user-agent:from:to:cc:subject:date:in-reply-to
 :message-id:mime-version:content-transfer-encoding;
 bh=vCHRcN7k3MFWeY5EzCrtKMl5ra1X7NCE45lCz5q5SIo=;
 b=p8zubJZYH3Fuw+rIjS2QX6PkbnDvKAyeVHT89aKWWgWUADinqfbshCpXhYqe4NGQyE
 26cJNq1WlGyJFKqwkVA2D0ygltiRfs/TIZrjTa6heSmv6aor9iZq1va/SEIP3zFVfGup
 JPcbFRKu4OhGnjWFywxRkpjNbTZQDaizoim16SZ11SCOnpVGfPY97OuyaMNnRUjlVa22
 TL5y/n041UWWrhOoLZ9jGm3Lxixb6dbgx1cH689ov9z3k/6I9kMfAaERpxlPPTilhJxc
 vbk/QCtGq00LSf9yoxsJ1loF1+jUO+l5GECgZBw3HGeg0B2kx6auqpYsvj8gptPfw7XL
 BP3w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:references:user-agent:from:to:cc:subject:date
 :in-reply-to:message-id:mime-version:content-transfer-encoding;
 bh=vCHRcN7k3MFWeY5EzCrtKMl5ra1X7NCE45lCz5q5SIo=;
 b=qXzLyhFAAM36WM0NMH3ndGds9JVtakLm9JRk0qsBk3zZkXioOwexPjZI3LYhqO1fjY
 Pbjfl9cWsSspsbeXBt5R7I9/dvOWDtpjx0jDNPEPoOds+AQvK5rZ2tcPMadUUhAOpTx/
 oy3GZ1w5s0U6HDChBnRGhYnz8Lt4HFhuNj02j41b6hiqLoxQG/9K1ZTYtuDf0WFxhCWo
 Zv2tK63jRcdI7FvkhryZIyiJ9xRr9fvlVshvL4CXRp/k/+E/D3FG6SjvIQXwIMjJChIT
 NcqMpB7+JlN9VeSig7LN2o5ek755PLdZMqBndQ8bhGd2Kmn0EnNtPF22IsGbZUMDw5pA
 JYfQ==
X-Gm-Message-State: AOAM530+0CKOqkOvLBfbgRGFsPP17L+Fx8CF0zsehySDkF6RQzs5uM2K
 Jpsuv4vut7lyh/BkKlMHht37AQ==
X-Google-Smtp-Source: ABdhPJwGZqGyuMIRZM5UYLPbc5SWCIHNL4zJFtylxpqoQQMY44PqxrVpoLlotGZ3MEHBRDLuIEpbcA==
X-Received: by 2002:aa7:d4ca:: with SMTP id t10mr642913edr.388.1616433451937; 
 Mon, 22 Mar 2021 10:17:31 -0700 (PDT)
Received: from zen.linaroharston ([51.148.130.216])
 by smtp.gmail.com with ESMTPSA id d1sm9948408eje.26.2021.03.22.10.17.29
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 22 Mar 2021 10:17:30 -0700 (PDT)
Received: from zen (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id 786E91FF7E;
 Mon, 22 Mar 2021 17:17:28 +0000 (GMT)
References: <20210322140206.9513-1-cfontana@suse.de>
 <20210322140206.9513-7-cfontana@suse.de>
User-agent: mu4e 1.5.11; emacs 28.0.50
From: Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
To: Claudio Fontana <cfontana@suse.de>
Subject: Re: [RFC v10 06/49] target/arm: split off cpu-sysemu.c
Date: Mon, 22 Mar 2021 17:17:23 +0000
In-reply-to: <20210322140206.9513-7-cfontana@suse.de>
Message-ID: <87czvrjefr.fsf@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::536;
 envelope-from=alex.bennee@linaro.org; helo=mail-ed1-x536.google.com
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
Cc: Peter Maydell <peter.maydell@linaro.org>,
 Eduardo Habkost <ehabkost@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org,
 Roman Bolshakov <r.bolshakov@yadro.com>, Paolo Bonzini <pbonzini@redhat.com>,
 Philippe =?utf-8?Q?Mathieu-D?= =?utf-8?Q?aud=C3=A9?= <philmd@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


Claudio Fontana <cfontana@suse.de> writes:

> move work is needed later on to split things into
> tcg-specific portions and kvm-specific portions of this
>
> Signed-off-by: Claudio Fontana <cfontana@suse.de>

Reviewed-by: Alex Benn=C3=A9e <alex.bennee@linaro.org>

--=20
Alex Benn=C3=A9e

