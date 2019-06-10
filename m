Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 441513B6F4
	for <lists+qemu-devel@lfdr.de>; Mon, 10 Jun 2019 16:09:25 +0200 (CEST)
Received: from localhost ([::1]:46892 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.86_2)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1haKzE-0000eR-EH
	for lists+qemu-devel@lfdr.de; Mon, 10 Jun 2019 10:09:24 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:53648)
 by lists.gnu.org with esmtp (Exim 4.86_2)
 (envelope-from <pbonzini@redhat.com>) id 1haKnB-00083R-IT
 for qemu-devel@nongnu.org; Mon, 10 Jun 2019 09:57:00 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <pbonzini@redhat.com>) id 1haKnA-0007Wr-Mq
 for qemu-devel@nongnu.org; Mon, 10 Jun 2019 09:56:57 -0400
Received: from mail-wr1-f68.google.com ([209.85.221.68]:43124)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <pbonzini@redhat.com>) id 1haKn9-0007Up-JO
 for qemu-devel@nongnu.org; Mon, 10 Jun 2019 09:56:55 -0400
Received: by mail-wr1-f68.google.com with SMTP id r18so9284137wrm.10
 for <qemu-devel@nongnu.org>; Mon, 10 Jun 2019 06:56:55 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=XH6Qbb6IBQeZarRhW3F78s2t+V31cXfFANsWOHjK9Sg=;
 b=Bmu3igeXH07V7/5MoMpC7ZQ7yVd50s+Og6ReH+g0hmWGCsj2kcNWuUS0gNy1QW2qKH
 K0jbrgONgDkAbxsSkWqyT01iJoc0mVfn3Lu/mSPYLRgWyGh+Wb/9gGPk+k9X+QXyPqXB
 GHYbohtH2tVrpjiqTfxskPuc/dfvv15a1AGl+KgwpSXn04maLVeq2JoZbS4nGZDB4T5N
 qagO3RvmIC1l56+0u0s/y7v4WwlG2BQJwkncwuWkdtjKYhFG0FMdlSmJV0dL+FXMs0dI
 CoxARslHsNKvdw6zCiwUW7vALNHfu+MmcT7EHgdwt6DN6mW2wRM5nAJSe/4zveD699bL
 WqRw==
X-Gm-Message-State: APjAAAUar/K5eFZRVf/Lnih9+RYbug9ayM9S5do01B09W/Rb9gB24tbD
 C8DTW/D3k22DDFHXqvDFJ36z6w==
X-Google-Smtp-Source: APXvYqxMsCw/5H6IqehD2c+B5uNSOdYvjwcK7iPmF3in5tdHL59eltU7kb4i12Lp6ci7X5i1iyUV1Q==
X-Received: by 2002:adf:f246:: with SMTP id b6mr21348396wrp.92.1560175014475; 
 Mon, 10 Jun 2019 06:56:54 -0700 (PDT)
Received: from ?IPv6:2001:b07:6468:f312:49d3:a711:c5a3:8ebf?
 ([2001:b07:6468:f312:49d3:a711:c5a3:8ebf])
 by smtp.gmail.com with ESMTPSA id a125sm11169083wmf.42.2019.06.10.06.56.53
 (version=TLS1_3 cipher=AEAD-AES128-GCM-SHA256 bits=128/128);
 Mon, 10 Jun 2019 06:56:53 -0700 (PDT)
To: Peter Maydell <peter.maydell@linaro.org>, qemu-devel@nongnu.org
References: <20190610134545.3743-1-peter.maydell@linaro.org>
From: Paolo Bonzini <pbonzini@redhat.com>
Message-ID: <f638478d-8149-0dbb-1d76-0c45c29cbaf1@redhat.com>
Date: Mon, 10 Jun 2019 15:56:52 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.6.1
MIME-Version: 1.0
In-Reply-To: <20190610134545.3743-1-peter.maydell@linaro.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
 [fuzzy]
X-Received-From: 209.85.221.68
Subject: Re: [Qemu-devel] [PATCH] qemu-ga: Convert invocation documentation
 to rST
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
Cc: John Snow <jsnow@redhat.com>, Michael Roth <mdroth@linux.vnet.ibm.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 10/06/19 15:45, Peter Maydell wrote:
> +# Canned command to build manpages from a single manual
> +build-manpages = $(call quiet-command,CONFDIR="$(qemu_confdir)" sphinx-build $(if $(V),,-q) -W -n -b man -D version=$(VERSION) -D release="$(FULL_VERSION)" -d .doctrees/$1 $(SRC_PATH)/docs/$1 $(MANUAL_BUILDDIR)/$1 ,"SPHINX","$(MANUAL_BUILDDIR)/$1")


...

> +# The rst_epilog fragment is effectively included in every rST file.
> +# We use it to define substitutions based on build config that
> +# can then be used in the documentation. The fallback if the
> +# environment variable is not set is for the benefit of readthedocs
> +# style document building; our Makefile always sets the variable.
> +confdir = os.getenv('CONFDIR', "/usr/local/etc")

This should be /usr/local/etc/qemu is you want $(qemu_confdir) above and
not $(sysconfdir).

But since we always set the variable when building from the QEMU build
system, perhaps "/etc" or "/etc/qemu" is a more useful default when
building the manual outside QEMU?

Paolo

> +rst_epilog = ".. |CONFDIR| replace:: ``" + confdir + "``\n"
> +


