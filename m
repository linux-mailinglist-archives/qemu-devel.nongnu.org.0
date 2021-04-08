Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0574A358759
	for <lists+qemu-devel@lfdr.de>; Thu,  8 Apr 2021 16:44:25 +0200 (CEST)
Received: from localhost ([::1]:36796 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lUVtP-0003j9-WC
	for lists+qemu-devel@lfdr.de; Thu, 08 Apr 2021 10:44:24 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:48780)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1lUVrn-0003Ep-4W
 for qemu-devel@nongnu.org; Thu, 08 Apr 2021 10:42:43 -0400
Received: from mail-wr1-x42b.google.com ([2a00:1450:4864:20::42b]:42756)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1lUVrl-0002Qg-Da
 for qemu-devel@nongnu.org; Thu, 08 Apr 2021 10:42:42 -0400
Received: by mail-wr1-x42b.google.com with SMTP id q26so2411346wrz.9
 for <qemu-devel@nongnu.org>; Thu, 08 Apr 2021 07:42:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=references:user-agent:from:to:cc:subject:date:in-reply-to
 :message-id:mime-version:content-transfer-encoding;
 bh=RiO1qM7CtzrBrBEhHjQMyie+PHrmSqk1n8gxVD5Y3RA=;
 b=IaKwl9rHK38RJ9iE3kopb5DhnkfBe5A+79PFqT5TuGnXzMEZGEjtyNOt5fVC8FASBE
 DWyuZXozeLyug/aCd8x1W0svMP4Cm+bsOlj1Hft6b2CnVgABy78sj2if79KbehizUtO0
 3rvEG4dSh29C3liDxLUR1g2nDShdP0PC5VWjqhUI8y/MMFjaMZbT3uE7XJl/u+zkeb8M
 opMfyYJwtCzWFe6CGpDI9+ZyUYieqYY9zKjBcWbCNFwgrytNg7utq6r+5OcVeyIO9qnE
 8VtjCM3TRVBdsFTqd1YdGxnlU8LogEgbq2I+kplzWFnmQZObc5a+99PucHcFlU7BvLUQ
 Hohw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:references:user-agent:from:to:cc:subject:date
 :in-reply-to:message-id:mime-version:content-transfer-encoding;
 bh=RiO1qM7CtzrBrBEhHjQMyie+PHrmSqk1n8gxVD5Y3RA=;
 b=nDrzlaaoIaI0m3VwKvPgIv4PwSsYgJdqPXqcYWfshkbtl6WtO6MU8IP29myfQ3Hxn/
 8yRukob0gw0QQBhix3+I28UPmqis1413HixZHZPJ+Y/r9Hkt+wTmklXi9Z5hOWteb3zn
 Sg1A+EychdrUN66VgdHnkAuFmkKvEQ93WU34HtkgQASrxs+uXzMvmzfmDfBagTPCnnR8
 CWLOYnpZqhfhgIp8G1qMbCyns6IQ514PWGIK/xqphyInxoYaaiTCiI6OZ6d47tt6hNWx
 43sE37S4NuHfREq4SH21rq+m794pbPoV8ySzraBxp7m8YCooMam5rEZ6x4OdGkkWtqCf
 FmEA==
X-Gm-Message-State: AOAM530wagtkaPhlwTGePzcPLNIMue5hQCRnGO6UK7lTUdNSrec9jwT+
 NfDHm3dkXHXho7BnlfIyEkRaTQ==
X-Google-Smtp-Source: ABdhPJwl5D73eiJU1nkR8y/Kk6SF/pJ1Rh9pQ+bn4zHwM7xDDMbZVNbwwqSiduLOqP356fU0BntZrw==
X-Received: by 2002:adf:b358:: with SMTP id k24mr11768026wrd.187.1617892959764; 
 Thu, 08 Apr 2021 07:42:39 -0700 (PDT)
Received: from zen.linaroharston ([51.148.130.216])
 by smtp.gmail.com with ESMTPSA id y124sm2182404wmg.41.2021.04.08.07.42.38
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 08 Apr 2021 07:42:38 -0700 (PDT)
Received: from zen (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id 335141FF7E;
 Thu,  8 Apr 2021 15:42:38 +0100 (BST)
References: <20210326193701.5981-1-cfontana@suse.de>
 <20210326193701.5981-6-cfontana@suse.de>
User-agent: mu4e 1.5.11; emacs 28.0.50
From: Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
To: Claudio Fontana <cfontana@suse.de>
Subject: Re: [RFC v12 05/65] target/arm: tcg: split mte_helper user-only and
 sysemu code
Date: Thu, 08 Apr 2021 15:41:57 +0100
In-reply-to: <20210326193701.5981-6-cfontana@suse.de>
Message-ID: <87zgy8suqp.fsf@linaro.org>
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
Cc: Peter Maydell <peter.maydell@linaro.org>,
 Eduardo Habkost <ehabkost@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org,
 Roman Bolshakov <r.bolshakov@yadro.com>, Paolo Bonzini <pbonzini@redhat.com>,
 Philippe =?utf-8?Q?Mathieu-D?= =?utf-8?Q?aud=C3=A9?= <philmd@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


Claudio Fontana <cfontana@suse.de> writes:

> allocation_tag_mem has a different implementation for
> user-only and sysemu, so move the two implementations into
> the dedicated subdirs.
>
> Signed-off-by: Claudio Fontana <cfontana@suse.de>
> Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

be aware rth has some MTE fixes in flight which will likely conflict
when merged - probably this cycle as they are fixes.

Reviewed-by: Alex Benn=C3=A9e <alex.bennee@linaro.org>

--=20
Alex Benn=C3=A9e

