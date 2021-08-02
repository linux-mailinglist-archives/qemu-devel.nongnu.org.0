Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4B1D83DD589
	for <lists+qemu-devel@lfdr.de>; Mon,  2 Aug 2021 14:19:57 +0200 (CEST)
Received: from localhost ([::1]:38630 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mAWvE-0004ZQ-CB
	for lists+qemu-devel@lfdr.de; Mon, 02 Aug 2021 08:19:56 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:53834)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1mAWtZ-0002AJ-BN
 for qemu-devel@nongnu.org; Mon, 02 Aug 2021 08:18:13 -0400
Received: from mail-ed1-x52f.google.com ([2a00:1450:4864:20::52f]:42602)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1mAWtY-0001m1-06
 for qemu-devel@nongnu.org; Mon, 02 Aug 2021 08:18:13 -0400
Received: by mail-ed1-x52f.google.com with SMTP id p21so24168398edi.9
 for <qemu-devel@nongnu.org>; Mon, 02 Aug 2021 05:18:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=I/f4QgbIQKfmT0/HWqwhZOn14zjXFUr0tCtgKVDInB4=;
 b=aygWpZmm8BNibC5HK81GnVQkaS6KgRx0n/E9NPZZ7+3blJEZPFwKPkBtm9oPR4w1mU
 JId4d2QNKiT1pg5TEvg27IR263FFOdQMVEPzgK1sQGfGded7YAT7t7WaxVVZCZi+fiXs
 kaYhOayXl9awIcIZrWg59oB++Va8mRAG3CphS2Qt/tWkRW5XLlT8UwOb+uVwetXNbzl2
 EkS8MFDXvCm8I2c64zFY3VG+VTJVHUB7WVRP/jM27Slv6C+mujxpEaq23Z3pAcN1MP88
 QPpd7h6mpbMvcg9rCU0HtNRYp0897a9pwi5ks+mbQPh3ro956ESJXqVaYtsS3Bp0MbDb
 gptA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=I/f4QgbIQKfmT0/HWqwhZOn14zjXFUr0tCtgKVDInB4=;
 b=Wym4QDIROcv4MlNbSh3eOXRSrByBmxGgy6qCXUVlnCeyG10vgoEkxuMS514Q4FZKM4
 n4CRYh5elaz/Hzk1MUApNoYZRk+fWyOM0Qe+ANV3otRrZFhZW/LblZR1SPKQeycN1lGl
 F+ymz3xQLUpZPkDxRUg4c7+9Ou+NzdCGqJbcbpcXKRKu08FpbOXtT1yB3fCp6a8H3wCG
 9N5XrhQz2PKwG4NjxggPXnP5QuLlvjd9x+HON3523TPeYRn77etftPiQcZzfPZYN8BS+
 UpLH+thbAnRyTO2ODlzCHJJk87Z/O3DyD25zE0HN9AVMrjhdBlaPd1OBInPNPj+bq47A
 5cSw==
X-Gm-Message-State: AOAM532PaANEfNzYWUHNmuubtQOBEivNjKX/8+eic1eo5JiXywLKy62z
 5mUE1OT/htD10hR8LIt7uYIp3UxKjOXMr6DQpntiY57/Yys=
X-Google-Smtp-Source: ABdhPJyaYEVEjiwLSTK9ixcWNWT6JDoZQLn2QFhTOjgUe5OmCPb9Wugdg9ORt5YodwgJHmBFEiIdMxYcwrQYx4AaW/k=
X-Received: by 2002:a05:6402:31e6:: with SMTP id
 dy6mr18981253edb.36.1627906690601; 
 Mon, 02 Aug 2021 05:18:10 -0700 (PDT)
MIME-Version: 1.0
References: <20210729175554.686474-1-ehabkost@redhat.com>
 <20210729175554.686474-6-ehabkost@redhat.com>
In-Reply-To: <20210729175554.686474-6-ehabkost@redhat.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Mon, 2 Aug 2021 13:17:27 +0100
Message-ID: <CAFEAcA9dRVeLVGSx+4bG848oTot4qVR4=Z6665ow+UXi62HMmw@mail.gmail.com>
Subject: Re: [PATCH for-6.2 05/10] docs: qom: Add subsection headings to
 declaration/definition macros section
To: Eduardo Habkost <ehabkost@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::52f;
 envelope-from=peter.maydell@linaro.org; helo=mail-ed1-x52f.google.com
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
Cc: Paolo Bonzini <pbonzini@redhat.com>,
 =?UTF-8?Q?Daniel_P=2E_Berrang=C3=A9?= <berrange@redhat.com>,
 QEMU Developers <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Thu, 29 Jul 2021 at 19:01, Eduardo Habkost <ehabkost@redhat.com> wrote:
>
> Add two new subsection headings to make the separation between
> "declaration macros" and "definition macros" more visible.
>
> Signed-off-by: Eduardo Habkost <ehabkost@redhat.com>
> ---
>  docs/devel/qom.rst | 6 ++++++
>  1 file changed, 6 insertions(+)

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

thanks
-- PMM

