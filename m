Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C722F2D3E9D
	for <lists+qemu-devel@lfdr.de>; Wed,  9 Dec 2020 10:25:02 +0100 (CET)
Received: from localhost ([::1]:55706 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kmviX-0000Dt-Nw
	for lists+qemu-devel@lfdr.de; Wed, 09 Dec 2020 04:25:01 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:55932)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1kmvg8-0007L3-61
 for qemu-devel@nongnu.org; Wed, 09 Dec 2020 04:22:32 -0500
Received: from mail-wm1-x329.google.com ([2a00:1450:4864:20::329]:38118)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1kmvg6-0006h9-Ft
 for qemu-devel@nongnu.org; Wed, 09 Dec 2020 04:22:31 -0500
Received: by mail-wm1-x329.google.com with SMTP id g185so879300wmf.3
 for <qemu-devel@nongnu.org>; Wed, 09 Dec 2020 01:22:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=references:user-agent:from:to:cc:subject:date:in-reply-to
 :message-id:mime-version:content-transfer-encoding;
 bh=SOD3NreGo1V885+N/yx+58IbyIp4/uSuO02wnwe4frc=;
 b=F26DNyhiRTME5j8EFGI0LanDmCGKIIsV33h58/OjVw3XfC9GxnWJLeopzsbcqrbsh7
 zdFx/AP/kzEbj7tjbUAx1gR9h735TVz5mUigcjKPeOrul9CF3/kpSS9Nhftu54huzReR
 ApIaP/PTLRPjBwHG4W+GbIqR3u7hsoIjedIQZuu43/Ba+zb219wvp0CcgYBRrYz8sAZ8
 I1xXIUWCDqOZCTMAqZWqCFLRWONv9KtLfUfrq113whwIuK3ZfCqWpkjpCRZXgp7HOr76
 111pAEw4gBmy51W1wn+dBX1P/3cVs1BU9K5wFWTwFVo1bNJPEaeu5lpJUIGnGzBBQ69y
 dAMg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:references:user-agent:from:to:cc:subject:date
 :in-reply-to:message-id:mime-version:content-transfer-encoding;
 bh=SOD3NreGo1V885+N/yx+58IbyIp4/uSuO02wnwe4frc=;
 b=oOXmUnc22d2XlWcJEJ9Ngkxi7ISujXYCdNj1JAWPgpj4F6qqTtN1RwpztnvZIDICRT
 UQhvIrT4IXxUjUsdEX+fGWZgTiD1eoiPtzkJbWsuybkExCL7v0qw0i8xjbOqYLJKX1P6
 79Za+bUMbmYsCYM7PdjzwePtzacopQOaA9S8GPdTRDYEPNRjYokcJnkv5pqv9dAfGx7i
 p55zhovBnp0ieNKVrpYpx3UtIfNPgeuE5NMG6ZyvLlFPmbls++4MoFKiLuMwMnRc5e7b
 pQufCrQoVYDxqfiz9hdMYRa0jkCTFCl1o9VS4boqHw0RT54o0UJpyrRsegpCFsx596NM
 YP6A==
X-Gm-Message-State: AOAM5332rTPKtQ3L8neKH1RVZlfUa6feuVbxj/VSaUYqtQMEroDC7u8U
 Qz+/JmjmGY9QeeXTJ6/QU5/sWg==
X-Google-Smtp-Source: ABdhPJx+L7yHWTplPQjrbJzufz0JBmuUNOn2g5Poa6WPgzGQhv3H+LLlWsplRDO/sT+MKhd/UM16ww==
X-Received: by 2002:a1c:7c03:: with SMTP id x3mr1730450wmc.17.1607505749162;
 Wed, 09 Dec 2020 01:22:29 -0800 (PST)
Received: from zen.linaroharston ([51.148.130.216])
 by smtp.gmail.com with ESMTPSA id t10sm2301007wrp.39.2020.12.09.01.22.27
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 09 Dec 2020 01:22:27 -0800 (PST)
Received: from zen (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id CFE421FF7E;
 Wed,  9 Dec 2020 09:22:26 +0000 (GMT)
References: <20201208194839.31305-1-cfontana@suse.de>
 <20201208194839.31305-7-cfontana@suse.de>
User-agent: mu4e 1.5.7; emacs 28.0.50
From: Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
To: Claudio Fontana <cfontana@suse.de>
Subject: Re: [RFC v9 06/32] i386: move hax accel files into hax/
Date: Wed, 09 Dec 2020 09:22:21 +0000
In-reply-to: <20201208194839.31305-7-cfontana@suse.de>
Message-ID: <87h7ovfi5p.fsf@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::329;
 envelope-from=alex.bennee@linaro.org; helo=mail-wm1-x329.google.com
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

> Signed-off-by: Claudio Fontana <cfontana@suse.de>

Reviewed-by: Alex Benn=C3=A9e <alex.bennee@linaro.org>

--=20
Alex Benn=C3=A9e

