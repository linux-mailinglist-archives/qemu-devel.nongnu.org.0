Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B083E29938C
	for <lists+qemu-devel@lfdr.de>; Mon, 26 Oct 2020 18:18:37 +0100 (CET)
Received: from localhost ([::1]:52168 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kX68i-0005w4-M5
	for lists+qemu-devel@lfdr.de; Mon, 26 Oct 2020 13:18:36 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:48358)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1kX65h-00047h-V3
 for qemu-devel@nongnu.org; Mon, 26 Oct 2020 13:15:29 -0400
Received: from mail-wm1-x341.google.com ([2a00:1450:4864:20::341]:38878)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1kX65g-0007sA-82
 for qemu-devel@nongnu.org; Mon, 26 Oct 2020 13:15:29 -0400
Received: by mail-wm1-x341.google.com with SMTP id l15so13294246wmi.3
 for <qemu-devel@nongnu.org>; Mon, 26 Oct 2020 10:15:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=references:user-agent:from:to:cc:subject:in-reply-to:date
 :message-id:mime-version:content-transfer-encoding;
 bh=AXbyYdXP9bE13GOya0q/0LeFMAZ4w4jljUkUSf4KYts=;
 b=nsNBPVGJaJcHUtJ0dgEdk0QsSUkPM7BklAIv0zDIX0Ut9xRnfSgAUdX0eVp2qivvE2
 zF5gsjVoWUUEVR7qssRjeEH8R77Qtyvy5JXszIZ/zN4KVkfy2bbiceI4bZ61ZXGzEb0E
 9flE4z5IQwgjobpuq4JJvsUQm30dRIU2GSrfdEvNRqvKAVdnb3uHQmwcSayPQlkar6Cr
 qVqCL3ZzrlD/jMqvLRDUA5DEAvJrp8FPscE2rrHZPZovk+28MQL7AQSYlN+zB68KCR90
 to3WPKJUCBAu0ElQ7VG6PKKOxiWqKtLZufPW/Ia0SoKGROqYSatTlc246Cr6XKWHvAHp
 Uukg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:references:user-agent:from:to:cc:subject
 :in-reply-to:date:message-id:mime-version:content-transfer-encoding;
 bh=AXbyYdXP9bE13GOya0q/0LeFMAZ4w4jljUkUSf4KYts=;
 b=CjyVhaW3FENIxtPyne6ngG7y+1ha1UBcy4KHoJ8mO7gP59Pq3khlsrgyTBpQ1kXsRC
 /DaEv2F5GsYxjiZP/WREAuVAWgzuXcNQG3RJ5+QgKCS0v2KVIqCYnIxpXRa6xd+t6iX+
 cAQU4Npif/4KRk1hI+2dSo0udCHjRbzCTR4jEJFFPtcPtJKFgn9I/dbUTJt4hefJ8wQ7
 0l0mafFRYlzPSa/Yt2cKrayGs15e5rm/28bzQerqiG1FCFY3Xx21vv6kuG/oqhbS/33H
 iIDm8k10zuj6jTM0lbD39RH0A2KHsQre6USXcEFVA5jycUocTgQG2UlB0Dq/eKUQkXdB
 muOQ==
X-Gm-Message-State: AOAM533QZEKmm8kub2hb76w/3sTCcXQUFe8O/9r9+mjpeB0kST3pvcN5
 lj7N8YIkXSSch8XzKSl/giXgywJPJIdtlQ==
X-Google-Smtp-Source: ABdhPJx2KHE2SckgqJZBVHfUT4PvWUgBvet7c2RmC3D89tYcZS9A3lHtknRSQXVFoOqIDDswSAfXbA==
X-Received: by 2002:a1c:2096:: with SMTP id g144mr17730481wmg.79.1603732525167; 
 Mon, 26 Oct 2020 10:15:25 -0700 (PDT)
Received: from zen.linaroharston ([51.148.130.216])
 by smtp.gmail.com with ESMTPSA id u3sm1954802wme.0.2020.10.26.10.15.23
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 26 Oct 2020 10:15:24 -0700 (PDT)
Received: from zen (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id 5AAC61FF7E;
 Mon, 26 Oct 2020 17:15:23 +0000 (GMT)
References: <20201026143028.3034018-1-pbonzini@redhat.com>
 <20201026143028.3034018-6-pbonzini@redhat.com>
User-agent: mu4e 1.5.6; emacs 28.0.50
From: Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
To: Paolo Bonzini <pbonzini@redhat.com>
Subject: Re: [PATCH 05/15] i386: remove bios_name
In-reply-to: <20201026143028.3034018-6-pbonzini@redhat.com>
Date: Mon, 26 Oct 2020 17:15:23 +0000
Message-ID: <873620hpsk.fsf@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::341;
 envelope-from=alex.bennee@linaro.org; helo=mail-wm1-x341.google.com
X-detected-operating-system: by eggs.gnu.org: No matching host in p0f cache.
 That's all we know.
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
Cc: philmd@redhat.com, qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


Paolo Bonzini <pbonzini@redhat.com> writes:

> Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>

Reviewed-by: Alex Benn=C3=A9e <alex.bennee@linaro.org>

--=20
Alex Benn=C3=A9e

