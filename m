Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5397A4D5F18
	for <lists+qemu-devel@lfdr.de>; Fri, 11 Mar 2022 11:05:25 +0100 (CET)
Received: from localhost ([::1]:57488 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nSc9E-0004CX-D3
	for lists+qemu-devel@lfdr.de; Fri, 11 Mar 2022 05:05:24 -0500
Received: from eggs.gnu.org ([209.51.188.92]:43782)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <imammedo@redhat.com>)
 id 1nSc6Z-000241-Vf
 for qemu-devel@nongnu.org; Fri, 11 Mar 2022 05:02:40 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:59753)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <imammedo@redhat.com>)
 id 1nSc6S-0002H4-KH
 for qemu-devel@nongnu.org; Fri, 11 Mar 2022 05:02:38 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1646992952;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=wUhOXoV64YeGk/sn/0QT/pmqlBR9KAEDE7ytHr6WYRo=;
 b=JQTXyP8H4F4mOsJ4zCsFyHYSh77uE9rUaRoRgfNbeM7iQSxZXy2Hi2fehF6XnPJtLBV1Tp
 LH1fQuNwjK2TPqAcOhfKMjMplauqQ4BUxSwDuJvJ092Hd8kq+2/MCzguapw3MzB9g0WLqa
 mbOaKQkoQF4zEWP5mjnF63Z5+5pgxqY=
Received: from mail-ej1-f70.google.com (mail-ej1-f70.google.com
 [209.85.218.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-28-WiW-8kfpOTW3uFFpN0XdOw-1; Fri, 11 Mar 2022 05:02:30 -0500
X-MC-Unique: WiW-8kfpOTW3uFFpN0XdOw-1
Received: by mail-ej1-f70.google.com with SMTP id
 qf24-20020a1709077f1800b006ce8c140d3dso4675467ejc.18
 for <qemu-devel@nongnu.org>; Fri, 11 Mar 2022 02:02:29 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=wUhOXoV64YeGk/sn/0QT/pmqlBR9KAEDE7ytHr6WYRo=;
 b=DsZyx0qh6cjXztaN3HgUITQdsqbQDwYAgV9bZzenK0zhzx9UL5jS0v/3p+SfSdPDLE
 MoZ+HM/h6TNAE+K8Cgi+jMGR8m60Zh2bV8qzLoKnR0HKtftNtn1AJrmF1xcCyZKllDG6
 WewfEKxs+ma5UEFz6UuNLtdMYzXjMfm3psWZFlw7d+Ot/qlqnkYk0zcadHGms3nZqkeN
 W6DgWGGnQBN25YRffJm4nxK/YpYYJ5vinUwRN2qaDJeUp0JeiTPcWorAV1aQkUz9O/HO
 aPMq5IduJzQKeiYUY0nBQL2Ngq5lhQ8iWsJs3qIxqQQYGznQF+r3uLHa6XlGn8rS7gvM
 H8zg==
X-Gm-Message-State: AOAM530I5He1Q02Li+GDOptxDp5n2QcbVy+rMO0FCzUsql5DBeYqQl0p
 zMgsnXqiB0/NL0uMpRDisMYYrjlT8lfZDtgQH4u9lGCaSHPav0wRzEiVS0FwWTHMta0d8fihr9J
 gX0xUjT6Q1WPGGMs=
X-Received: by 2002:a05:6402:5171:b0:415:eed0:664a with SMTP id
 d17-20020a056402517100b00415eed0664amr8223621ede.117.1646992948998; 
 Fri, 11 Mar 2022 02:02:28 -0800 (PST)
X-Google-Smtp-Source: ABdhPJz8o/+7Puj40FABQCNysI7ULeKYWv58jmgawHzJbeCf/wPjp8dPgEN1bbaa2Jeol2wxnxzqmw==
X-Received: by 2002:a05:6402:5171:b0:415:eed0:664a with SMTP id
 d17-20020a056402517100b00415eed0664amr8223599ede.117.1646992948785; 
 Fri, 11 Mar 2022 02:02:28 -0800 (PST)
Received: from localhost (nat-pool-brq-t.redhat.com. [213.175.37.10])
 by smtp.gmail.com with ESMTPSA id
 u10-20020a50d94a000000b004131aa2525esm3140825edj.49.2022.03.11.02.02.28
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 11 Mar 2022 02:02:28 -0800 (PST)
Date: Fri, 11 Mar 2022 11:02:27 +0100
From: Igor Mammedov <imammedo@redhat.com>
To: Gerd Hoffmann <kraxel@redhat.com>
Subject: Re: [PATCH v2 08/11] tests/acpi: disallow virt memory hotplug changes
Message-ID: <20220311110227.7495c05c@redhat.com>
In-Reply-To: <20220311053759.875785-9-kraxel@redhat.com>
References: <20220311053759.875785-1-kraxel@redhat.com>
 <20220311053759.875785-9-kraxel@redhat.com>
X-Mailer: Claws Mail 4.0.0 (GTK+ 3.24.31; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=imammedo@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=imammedo@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H5=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
Cc: Thomas Huth <thuth@redhat.com>, Beraldo Leal <bleal@redhat.com>,
 "Michael S. Tsirkin" <mst@redhat.com>,
 Philippe =?UTF-8?B?TWF0aGlldS1EYXVkw6k=?= <f4bug@amsat.org>,
 Wainer dos Santos Moschetta <wainersm@redhat.com>, qemu-devel@nongnu.org,
 Ani Sinha <ani@anisinha.ca>,
 Alex =?UTF-8?B?QmVubsOpZQ==?= <alex.bennee@linaro.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Fri, 11 Mar 2022 06:37:56 +0100
Gerd Hoffmann <kraxel@redhat.com> wrote:

> Signed-off-by: Gerd Hoffmann <kraxel@redhat.com>

Reviewed-by: Igor Mammedov <imammedo@redhat.com>

> ---
>  tests/qtest/bios-tables-test-allowed-diff.h | 1 -
>  1 file changed, 1 deletion(-)
> 
> diff --git a/tests/qtest/bios-tables-test-allowed-diff.h b/tests/qtest/bios-tables-test-allowed-diff.h
> index e569098abddc..dfb8523c8bf4 100644
> --- a/tests/qtest/bios-tables-test-allowed-diff.h
> +++ b/tests/qtest/bios-tables-test-allowed-diff.h
> @@ -1,2 +1 @@
>  /* List of comma-separated changed AML files to ignore */
> -"tests/data/acpi/virt/SSDT.memhp",


