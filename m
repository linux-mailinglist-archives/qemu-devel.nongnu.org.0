Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 75FF13026AE
	for <lists+qemu-devel@lfdr.de>; Mon, 25 Jan 2021 16:08:49 +0100 (CET)
Received: from localhost ([::1]:46726 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l43U0-0007Y2-0J
	for lists+qemu-devel@lfdr.de; Mon, 25 Jan 2021 10:08:48 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:46062)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1l43RX-0006Jp-6S
 for qemu-devel@nongnu.org; Mon, 25 Jan 2021 10:06:15 -0500
Received: from mail-wr1-x42d.google.com ([2a00:1450:4864:20::42d]:44987)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1l43RV-0003zr-2K
 for qemu-devel@nongnu.org; Mon, 25 Jan 2021 10:06:14 -0500
Received: by mail-wr1-x42d.google.com with SMTP id d16so12249119wro.11
 for <qemu-devel@nongnu.org>; Mon, 25 Jan 2021 07:06:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=references:user-agent:from:to:cc:subject:date:in-reply-to
 :message-id:mime-version:content-transfer-encoding;
 bh=o5v8KwAv8BaNnqdWiu+c0jo1IBLDfOXoM3oD3UD+FqM=;
 b=uvFJzfqLgN/Lcbfl20m7JbZwVmg7mjRCU+KXYPPmmdfJql6LCJTflIQ6synCmXMkvR
 Tj20QYbnacwY+bzux/3NztpSOLOQ76b+9+8zzI6ErTue76+DFvgJdP204SVkFq87REyF
 ZQfsW2hQstYS/eRPS3Bm4dkzBdINEI8I2oB4qjofA8r5TwjKlFrrDOPV6PNKUGI874WU
 0M6zbYmkwPly0a7rYHdxoutgxEbj9M16KFnI7HbHermlheL6lcS4vfRhGJDYn8x7kbyf
 oakJ7aeQAyStPeyJ9bRawnu4A2CWMepkYyRzqU0QlxCjKrgS+zWS/ADoZO9Vswep6wJs
 pWCg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:references:user-agent:from:to:cc:subject:date
 :in-reply-to:message-id:mime-version:content-transfer-encoding;
 bh=o5v8KwAv8BaNnqdWiu+c0jo1IBLDfOXoM3oD3UD+FqM=;
 b=oP6HgxmHOylWZpNf1pn4E/G5ZZ9qnnnWYPGtZwITD/cUfl/9NBkV6jeDVsgD1vHquQ
 4+fiCdxUuBA/wfRjjmp4eFHD180imPTLdvJW25K/VUZYjJ44I/jKvNUBePfZasFa7Xzt
 VUwedlntHX7mafydiMi6aHC6fZkAtagKOT+IWk6Eyf6F91t1/tFEBf1EhncdmSqdDgeF
 NFjMTry24DONnY6kgdH8VqCbrdt4/CQaMxLK7NQ5W2K6RC5IL9Ge0HukEnxiSu2IlxRP
 eIy4p6RfG3Ms+YjxI9ZLHXjQ3lPfFijZmZMxaMu0+Krn1qnzznNFL53Ux7F1yO14Eifl
 u22g==
X-Gm-Message-State: AOAM530/54L/T3x3DYnGdJ70oUNM/ub+AnpAeqQEs/AgmPGjCKTdRK3y
 YcNN2iPu+P8l4q4MxTZSXwd9vw==
X-Google-Smtp-Source: ABdhPJxWPsnYgqJcC7GtZ+ahf1jGkYZQVid0YPBW1oXyev+qisF3+rPK5+XIG+Oqv0htKPCE9MIyhg==
X-Received: by 2002:adf:f9d0:: with SMTP id w16mr1446051wrr.137.1611587168716; 
 Mon, 25 Jan 2021 07:06:08 -0800 (PST)
Received: from zen.linaroharston ([51.148.130.216])
 by smtp.gmail.com with ESMTPSA id z4sm2246162wrw.38.2021.01.25.07.06.07
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 25 Jan 2021 07:06:07 -0800 (PST)
Received: from zen (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id 90CD71FF7E;
 Mon, 25 Jan 2021 15:06:06 +0000 (GMT)
References: <20210122204441.2145197-1-philmd@redhat.com>
 <20210122204441.2145197-3-philmd@redhat.com>
User-agent: mu4e 1.5.7; emacs 28.0.50
From: Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
To: Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <philmd@redhat.com>
Subject: Re: [PATCH v2 02/12] tests/meson: Only build softfloat objects if
 TCG is selected
Date: Mon, 25 Jan 2021 15:05:58 +0000
In-reply-to: <20210122204441.2145197-3-philmd@redhat.com>
Message-ID: <87czxtkqe9.fsf@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::42d;
 envelope-from=alex.bennee@linaro.org; helo=mail-wr1-x42d.google.com
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
Cc: Thomas Huth <thuth@redhat.com>,
 =?utf-8?Q?Daniel_P=2E_Berrang=C3=A9?= <berrange@redhat.com>,
 Eduardo Habkost <ehabkost@redhat.com>, Michael Roth <michael.roth@amd.com>,
 Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org,
 Markus Armbruster <armbru@redhat.com>, "Emilio G . Cota" <cota@braap.org>,
 Claudio Fontana <cfontana@suse.de>, Paolo Bonzini <pbonzini@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


Philippe Mathieu-Daud=C3=A9 <philmd@redhat.com> writes:

> Suggested-by: Paolo Bonzini <pbonzini@redhat.com>
> Signed-off-by: Philippe Mathieu-Daud=C3=A9 <philmd@redhat.com>
> ---
> Cc: Richard Henderson <richard.henderson@linaro.org>
> Cc: Alex Benn=C3=A9e <alex.bennee@linaro.org>
> Cc: Emilio G. Cota <cota@braap.org>

Reviewed-by: Alex Benn=C3=A9e <alex.bennee@linaro.org>

--=20
Alex Benn=C3=A9e

