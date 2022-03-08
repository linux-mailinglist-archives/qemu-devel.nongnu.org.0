Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 58FEB4D1DAE
	for <lists+qemu-devel@lfdr.de>; Tue,  8 Mar 2022 17:46:31 +0100 (CET)
Received: from localhost ([::1]:41448 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nRcyj-0003qf-VI
	for lists+qemu-devel@lfdr.de; Tue, 08 Mar 2022 11:46:29 -0500
Received: from eggs.gnu.org ([209.51.188.92]:41368)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ani@anisinha.ca>) id 1nRcxe-0002TV-5f
 for qemu-devel@nongnu.org; Tue, 08 Mar 2022 11:45:22 -0500
Received: from [2607:f8b0:4864:20::1032] (port=43861
 helo=mail-pj1-x1032.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <ani@anisinha.ca>) id 1nRcxc-0003K0-KQ
 for qemu-devel@nongnu.org; Tue, 08 Mar 2022 11:45:21 -0500
Received: by mail-pj1-x1032.google.com with SMTP id
 z12-20020a17090ad78c00b001bf022b69d6so2929235pju.2
 for <qemu-devel@nongnu.org>; Tue, 08 Mar 2022 08:45:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=anisinha-ca.20210112.gappssmtp.com; s=20210112;
 h=from:date:to:cc:subject:in-reply-to:message-id:references
 :user-agent:mime-version;
 bh=cJqJKagZUY3Y3qNlO+PmvpQfYuWWbRyZk069e2PFsP0=;
 b=Bm9eDZFsN91WE76bMPu2fHZj83FpgZrVEdF/ORYr0f++To+rvkhjlNxi0b+HfPsYB6
 /0gVEtBZjxSKO//MarxjP8H7goQzftFVzcjxOvInW8EPCOEhI4qjmj/+sevhCD10XRBB
 PY6xc/lEGvFp0eoXeFzb/5ubgsyGpjKKDm7+R+h/xK0RJKCHcxt/r1nPuohbJq7ojpYM
 4E4MeB2rH0RmQ+kWyKWtnhJhylLoEfw/NJtphhMD1CalUVgMcp20FaD95H5oHUHPVzjI
 Nm9zTe23vmSAn2yGS7RZFr/t+yGHHXaX0tZ0Fdwsr3J+6S6MltZhXkzMdRTepYJ8R1M/
 pYaQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:date:to:cc:subject:in-reply-to:message-id
 :references:user-agent:mime-version;
 bh=cJqJKagZUY3Y3qNlO+PmvpQfYuWWbRyZk069e2PFsP0=;
 b=JjDM13Ddr/wqyGPKa27cEDhMt6ey/563FbooImgfnhBZ3EvVGhLqa7dYxEpnZf9gv/
 ubPnld1jXGGeUj+BDnPBEejJFA/hKMeuNc1ZlJyle3fhHnYXWDZ5fII67z6DdmSqN2zH
 Eoatpk03Jo3jl/lB/6O33CVs2fHK9Hn9f/sTqWTlWmSTHrQmW7DHnToqSrhO6MqgfDWO
 i+/uuVcNoWHdH8sIqrHKBhjtKZQAyDpuW4G7PrGI87EBQNf1zvCleS2h9/fLkDC7R9CO
 Qd4eMF6kbn+tChLGyEJ9NyQbDbnZd1xMqOWO4Y2GoAliovFX3KtKhzz6IiqG2Gj9ZMj/
 GaKg==
X-Gm-Message-State: AOAM530ddqC4yS+zcxqiTHg6omSiFVPugGThvoFaH8Q66m445g9S8lG4
 qVEjSHBu60MwmHQYtZtkN+WlTQ==
X-Google-Smtp-Source: ABdhPJw7pl6ISHKJmCE+ITneJgziGomv/WI2n1vDaFHsL15pTJfceFcUByfVMBczVNW46u/GOklBsw==
X-Received: by 2002:a17:90b:1d83:b0:1bf:39d7:207d with SMTP id
 pf3-20020a17090b1d8300b001bf39d7207dmr5680470pjb.130.1646757917612; 
 Tue, 08 Mar 2022 08:45:17 -0800 (PST)
Received: from anisinha-lenovo ([115.96.121.168])
 by smtp.googlemail.com with ESMTPSA id
 k19-20020a056a00135300b004f734327960sm3068253pfu.106.2022.03.08.08.45.14
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 08 Mar 2022 08:45:17 -0800 (PST)
From: Ani Sinha <ani@anisinha.ca>
X-Google-Original-From: Ani Sinha <anisinha@anisinha.ca>
Date: Tue, 8 Mar 2022 22:15:11 +0530 (IST)
X-X-Sender: anisinha@anisinha-lenovo
To: Laine Stump <laine@redhat.com>
Subject: Re: [libvirt] [PATCH RESEND v2 0/4] re-introduce <acpi-hotplug-bridge>
In-Reply-To: <f744a5f1-6dde-4b57-d52a-9b6104c5e510@redhat.com>
Message-ID: <alpine.DEB.2.22.394.2203082212120.2312236@anisinha-lenovo>
References: <20220308063955.2285902-1-ani@anisinha.ca>
 <399ca3a9-8b95-39af-8376-85f2edf00c7e@redhat.com>
 <f744a5f1-6dde-4b57-d52a-9b6104c5e510@redhat.com>
User-Agent: Alpine 2.22 (DEB 394 2020-01-19)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::1032
 (failed)
Received-SPF: none client-ip=2607:f8b0:4864:20::1032;
 envelope-from=ani@anisinha.ca; helo=mail-pj1-x1032.google.com
X-Spam_score_int: -4
X-Spam_score: -0.5
X-Spam_bar: /
X-Spam_report: (-0.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, PDS_HP_HELO_NORDNS=0.659, RCVD_IN_DNSWL_NONE=-0.0001,
 RDNS_NONE=0.793, SPF_HELO_NONE=0.001, SPF_NONE=0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=no autolearn_force=no
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
Cc: "Michael S. Tsirkin" <mst@redhat.com>, libvir-list@redhat.com,
 jusual@redhat.com, qemu list <qemu-devel@nongnu.org>,
 Ani Sinha <ani@anisinha.ca>, imammedo@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>



On Tue, 8 Mar 2022, Laine Stump wrote:

> Aha! the domain of qemu-devel@nongnu.org was incorrect in the original send
> (it was "nognu.org"), so none of this thread was making it to that list.


Not to give any excuses but this happened because on Qemu side I never
have to type this manually. My git config is set up so that
the cc in send-email is filled up automatically using
scripts/get_maintainer.pl. On libvirt side also the domain and mailing
list is easy to remember. Its only when I have to manually type stuff that
shit happens :-)

