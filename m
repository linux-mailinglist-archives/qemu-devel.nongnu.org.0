Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 22B9F423878
	for <lists+qemu-devel@lfdr.de>; Wed,  6 Oct 2021 09:02:56 +0200 (CEST)
Received: from localhost ([::1]:60670 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mY0x4-0008D0-Vw
	for lists+qemu-devel@lfdr.de; Wed, 06 Oct 2021 03:02:55 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:41330)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ani@anisinha.ca>) id 1mY0uR-0007KE-BU
 for qemu-devel@nongnu.org; Wed, 06 Oct 2021 03:00:11 -0400
Received: from mail-pg1-x535.google.com ([2607:f8b0:4864:20::535]:46067)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <ani@anisinha.ca>) id 1mY0uP-0004Eg-Sn
 for qemu-devel@nongnu.org; Wed, 06 Oct 2021 03:00:11 -0400
Received: by mail-pg1-x535.google.com with SMTP id q201so1616528pgq.12
 for <qemu-devel@nongnu.org>; Wed, 06 Oct 2021 00:00:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=anisinha-ca.20210112.gappssmtp.com; s=20210112;
 h=from:date:to:cc:subject:in-reply-to:message-id:references
 :user-agent:mime-version;
 bh=Yi/qDc8nnn5gW18TqgmTptwOuPDsZkDNGWtnoO548GM=;
 b=aCx7EvzzAwAGo+LhEm0IdT6pw98y98p2LK7OM30SNFBnicAJes0yzgh3QgIfMCXWU5
 LS8Sh2KlZglljLE6KqMJ3X7j6Y9DIm2cpNoq4XWHiJCTKYIy/iRtBYjF2aPlU7w7Ly+2
 b//LSLpSZ9+R+Rw4ftdEaD5QsCSGmmyaWMjRFQgaxnBpcdb/s6cCggY5MXnr58Wt0kgm
 hMtGJIu3rXDqv7n/7DWrRnSNL93cfUrfEiP6ODSBDg7wsjWFt6AykWAP5hlQbNyKN3+9
 iadb0gBkg/cvVrA57xEeC0aJ+Ds8IKiltM+eFAQfiWi5w9Xr/rR6XlXr7Awb2CXqb3xi
 NFRQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:date:to:cc:subject:in-reply-to:message-id
 :references:user-agent:mime-version;
 bh=Yi/qDc8nnn5gW18TqgmTptwOuPDsZkDNGWtnoO548GM=;
 b=bnzeK0qgVDi+VWdTamDryGaVayZGL+UjyWLfC7HMI9vlcwdB4FqY/5MHpvSkyqflUb
 oWZGs9/qaTxAyA2hM6VjqBDToixKpSEM47HEUJ8I5WcFL+sVZZt5PcjvQXcwhT+J0mgd
 2ETMiWTkJsJETl5jgFuuzgPIMjiN5pi6iQiD9qv44ir8cgq0Ud5jna7Z2zB5NogIWJeo
 iWpXwoC4F5mtbYNNjAt51AhXfRaaVc2SO40BuLxT9HOsIxRkVKBu/Qtw0izYijRXB3kL
 7bQ8YO3gLRVuU4HVzEk8LpfAYXrvL2zgd8hGTTTb6LE4ddpqp1lMYvc9i+ZwTfeWfa+5
 HbFQ==
X-Gm-Message-State: AOAM53171wuRJJlJd2VvdnemJBPmrsxOpbmjpMxFhJl4SHtU4l8Pk3Au
 XMvLeuSreIKPVVhtRvzOR/kkNg==
X-Google-Smtp-Source: ABdhPJw9/FACuLvj6xDi1ehzGJBTRKrpwB/ylKFmqN7jVpQWMxtFj8jdIHqbDgxQIxAqU5/oWvigAw==
X-Received: by 2002:aa7:8882:0:b0:44c:9270:1cba with SMTP id
 z2-20020aa78882000000b0044c92701cbamr3516864pfe.26.1633503608629; 
 Wed, 06 Oct 2021 00:00:08 -0700 (PDT)
Received: from anisinha-lenovo ([115.96.129.122])
 by smtp.googlemail.com with ESMTPSA id u12sm19151292pgi.21.2021.10.06.00.00.05
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 06 Oct 2021 00:00:08 -0700 (PDT)
From: Ani Sinha <ani@anisinha.ca>
X-Google-Original-From: Ani Sinha <anisinha@anisinha.ca>
Date: Wed, 6 Oct 2021 12:30:01 +0530 (IST)
X-X-Sender: anisinha@anisinha-lenovo
To: Ani Sinha <ani@anisinha.ca>
Subject: Re: [PATCH] ACPI ERST: specification for ERST support
In-Reply-To: <20211006065808.1054102-1-ani@anisinha.ca>
Message-ID: <alpine.DEB.2.22.394.2110061229270.820442@anisinha-lenovo>
References: <1628202639-16361-3-git-send-email-eric.devolder@oracle.com>
 <20211006065808.1054102-1-ani@anisinha.ca>
User-Agent: Alpine 2.22 (DEB 394 2020-01-19)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Received-SPF: none client-ip=2607:f8b0:4864:20::535;
 envelope-from=ani@anisinha.ca; helo=mail-pg1-x535.google.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_NONE=0.001 autolearn=ham autolearn_force=no
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
Cc: ehabkost@redhat.com, mst@redhat.com, konrad.wilk@oracle.com,
 qemu-devel@nongnu.org, pbonzini@redhat.com, imammedo@redhat.com,
 boris.ostrovsky@oracle.com, eric.devolder@oracle.com, rth@twiddle.net
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>



On Wed, 6 Oct 2021, Ani Sinha wrote:

> From: Eric DeVolder <eric.devolder@oracle.com>
>
> >---
> > docs/specs/acpi_erst.txt | 147 +++++++++++++++++++++++++++++++++++++++
> > 1 file changed, 147 insertions(+)
> > create mode 100644 docs/specs/acpi_erst.txt
> >

OK it did not come out the way I wanted. But

Acked-by: Ani Sinha <ani@anisinha.ca>


