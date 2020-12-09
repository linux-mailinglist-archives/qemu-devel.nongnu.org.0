Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6CB9A2D4266
	for <lists+qemu-devel@lfdr.de>; Wed,  9 Dec 2020 13:49:15 +0100 (CET)
Received: from localhost ([::1]:54552 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kmyuA-00049o-H0
	for lists+qemu-devel@lfdr.de; Wed, 09 Dec 2020 07:49:14 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:47960)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1kmysJ-0003I1-N1
 for qemu-devel@nongnu.org; Wed, 09 Dec 2020 07:47:21 -0500
Received: from mail-wm1-x32c.google.com ([2a00:1450:4864:20::32c]:52382)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1kmysH-0002sy-6m
 for qemu-devel@nongnu.org; Wed, 09 Dec 2020 07:47:19 -0500
Received: by mail-wm1-x32c.google.com with SMTP id a6so1371183wmc.2
 for <qemu-devel@nongnu.org>; Wed, 09 Dec 2020 04:47:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=references:user-agent:from:to:cc:subject:date:in-reply-to
 :message-id:mime-version:content-transfer-encoding;
 bh=J1nKDDkqNnnY6ou/uR6IyZ3DN8MFAArb4IZmcEZOiDc=;
 b=mE2BGEC7/MKFbpaMzGbNzwWcYO7Z3yLp7YzrANokJZSwlH0BHSDVOEUp6nUyn7FPvG
 S1jRWszvb6JmqQCiol6I9hwlk9o59bQl8szPUo9RTmKDDlGC5TXdtzhSsBhU6OErkXtj
 YmP4JMuCm4YkCp/qLYz6ZcQgzs4hUR6C30eVhjDtgXwc3g1P+LrXhvMhiKWK0d9VUzkQ
 AV2rmZnLirLtlRbv9Oj43zFHrQzpAuAUNPYMbBZa0y277nKldGZm2cYFGgQxnWVRFn1g
 Ct84IpE/iRlugl9d6wx5RbCuc1B/SJacGSN661QfSLdTUnsLXSYhzCiVuEPsag2rZnGe
 hqDw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:references:user-agent:from:to:cc:subject:date
 :in-reply-to:message-id:mime-version:content-transfer-encoding;
 bh=J1nKDDkqNnnY6ou/uR6IyZ3DN8MFAArb4IZmcEZOiDc=;
 b=kyT1zTzyU19sUN+vEkUU3icsteJQ5njunFHk4w5fQvjXbRCiIRET6P0QmKDj2e9LNL
 qezWIFryzuh151y5/JUI6OyEAges2ccwpiczOCx9jFPyceKxMJpV7JAJOhPvCRG3Pwkc
 n2FU8oasshokwX5vXienFi3IsU8zPNvjfI4iQe3SYRK+kCN0aDhLMp2xMpkxUKPpBdmP
 Zb5cpOzdtAAe8TIHc+4VQEbCmgkSSshu0IP+JR5AUZho7ni9tMz73JXLGhq3i/Y416Yb
 pK0NzLwuc4B1adXCymJhCdGrB8y4zbV+dWyW1sTeBQYFyUbNac7iHDDmbMpKMJadiUGA
 +LIg==
X-Gm-Message-State: AOAM5334W6huUAi5L1HRcaVDHkdgdjX5Wqzg1jsF1J20UtCY53u0kEXY
 gxtwtLR7U+pdyLbjW8Bs2DiquQ==
X-Google-Smtp-Source: ABdhPJwE8ugIsRKyaYQc7EtSwGjwoFu4xJrroPNd1sH3pl8U2W++X/CknFThC8rFs6cKPfLxx8p7lg==
X-Received: by 2002:a1c:24c4:: with SMTP id k187mr2691193wmk.14.1607518035491; 
 Wed, 09 Dec 2020 04:47:15 -0800 (PST)
Received: from zen.linaroharston ([51.148.130.216])
 by smtp.gmail.com with ESMTPSA id w12sm3718097wre.57.2020.12.09.04.47.13
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 09 Dec 2020 04:47:14 -0800 (PST)
Received: from zen (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id 702891FF7E;
 Wed,  9 Dec 2020 12:47:12 +0000 (GMT)
References: <20201208194839.31305-1-cfontana@suse.de>
 <20201208194839.31305-26-cfontana@suse.de>
User-agent: mu4e 1.5.7; emacs 28.0.50
From: Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
To: Claudio Fontana <cfontana@suse.de>
Subject: Re: [RFC v9 25/32] cpu: move do_unaligned_access to tcg_ops
Date: Wed, 09 Dec 2020 12:47:05 +0000
In-reply-to: <20201208194839.31305-26-cfontana@suse.de>
Message-ID: <87y2i7cfjj.fsf@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::32c;
 envelope-from=alex.bennee@linaro.org; helo=mail-wm1-x32c.google.com
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
Cc: Paul Durrant <paul@xen.org>, Jason Wang <jasowang@redhat.com>,
 qemu-devel@nongnu.org, Peter Xu <peterx@redhat.com>, haxm-team@intel.com,
 Colin Xu <colin.xu@intel.com>, Olaf Hering <ohering@suse.de>,
 Stefano Stabellini <sstabellini@kernel.org>, Bruce Rogers <brogers@suse.com>,
 "Emilio G . Cota" <cota@braap.org>, Anthony Perard <anthony.perard@citrix.com>,
 Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
 Laurent Vivier <lvivier@redhat.com>, Thomas Huth <thuth@redhat.com>,
 Eduardo Habkost <ehabkost@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Cameron Esfahani <dirty@apple.com>, Dario Faggioli <dfaggioli@suse.com>,
 Roman Bolshakov <r.bolshakov@yadro.com>,
 Sunil Muthuswamy <sunilmut@microsoft.com>,
 Marcelo Tosatti <mtosatti@redhat.com>, Wenchao Wang <wenchao.wang@intel.com>,
 Paolo Bonzini <pbonzini@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


Claudio Fontana <cfontana@suse.de> writes:

> make it consistently SOFTMMU-only.
>
> Signed-off-by: Claudio Fontana <cfontana@suse.de>

Reviewed-by: Alex Benn=C3=A9e <alex.bennee@linaro.org>

--=20
Alex Benn=C3=A9e

