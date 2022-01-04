Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id CC450483F3F
	for <lists+qemu-devel@lfdr.de>; Tue,  4 Jan 2022 10:36:52 +0100 (CET)
Received: from localhost ([::1]:41964 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1n4gFP-0002NK-Ua
	for lists+qemu-devel@lfdr.de; Tue, 04 Jan 2022 04:36:51 -0500
Received: from eggs.gnu.org ([209.51.188.92]:39392)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <imammedo@redhat.com>)
 id 1n4gD2-0000os-1T
 for qemu-devel@nongnu.org; Tue, 04 Jan 2022 04:34:24 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:41529)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <imammedo@redhat.com>)
 id 1n4gCz-00058B-Ka
 for qemu-devel@nongnu.org; Tue, 04 Jan 2022 04:34:23 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1641288859;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=HzMZR2ZjVbWArqEQGpvxHm56eCK0XGiypcERpLaanbU=;
 b=C86jg6kqlGkVNGfkCVFdfs9AJmFHigX1CFlq4rbc9xdrLD3Ojfm8k7TBRyVbjuzq01ZNmE
 D+k9Hqeq/JedGKYt/9n2xEgZh1mETSAUO0wk9b8xdUVyztpVUTthMCC1iUEQ7WYCU7JEOJ
 5lEfw695dq3aIiQkiWS69ApQ7bvPCV4=
Received: from mail-ed1-f69.google.com (mail-ed1-f69.google.com
 [209.85.208.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-654-meq-qwuwMLK2Vv777pl7cA-1; Tue, 04 Jan 2022 04:34:18 -0500
X-MC-Unique: meq-qwuwMLK2Vv777pl7cA-1
Received: by mail-ed1-f69.google.com with SMTP id
 dz8-20020a0564021d4800b003f897935eb3so24883512edb.12
 for <qemu-devel@nongnu.org>; Tue, 04 Jan 2022 01:34:18 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=HzMZR2ZjVbWArqEQGpvxHm56eCK0XGiypcERpLaanbU=;
 b=t7vnmHEjc9/tEUoUpqol/zWMBuyzilDsMRn/JrtYkKfrl9p6GGzVcbZtZZZjKanhGD
 oTdv3V7Xz0is0sZwMswM2MrzcrUDxReMgbNNcNWjmJcN8UGLYoKpom1hQiX4+SydW7o0
 Im8FlvJX8xoHRta7gvpj2Dj3knCFJ4kfhkle9tTGFGx8l6vBHlDt6oIgAzUnJA5j3XwV
 79LpIoCzVSdNQEdfN8YETKYxxGHpNC4jBFW9OVmPhd8XrzwVAe4hAtJ0JfGHAKwlN4cD
 7ytBdRR3dq7J8Na5p5k1IXlNm1Vv2S1CISFQgdQ0out8WNNY8jH56mJGjFaRMF/Kpqb8
 gfOA==
X-Gm-Message-State: AOAM533ha4sE7BSvzFCSaRxcte6WCL5oo3XGOA9XR1Tt+CMUinqH8Dfb
 5CuWNQZ4ta3hVT1U5H2HqQdHyDsGaagIRus+ra+zBetWjfPzFS0BCFsEpp1Zc88PG5SFpoLUVy+
 9P2seZdGbBcOvCtU=
X-Received: by 2002:a17:907:1692:: with SMTP id
 hc18mr38799724ejc.558.1641288857828; 
 Tue, 04 Jan 2022 01:34:17 -0800 (PST)
X-Google-Smtp-Source: ABdhPJy4vNxFE0Njt2FkLAwsuI8SDC/6G4DvUNHNscgmDjOZuhe77P/pvXRsH2bwwR9JaM2R2aR+gQ==
X-Received: by 2002:a17:907:1692:: with SMTP id
 hc18mr38799714ejc.558.1641288857602; 
 Tue, 04 Jan 2022 01:34:17 -0800 (PST)
Received: from localhost (nat-pool-brq-t.redhat.com. [213.175.37.10])
 by smtp.gmail.com with ESMTPSA id dn4sm11415607ejc.95.2022.01.04.01.34.16
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 04 Jan 2022 01:34:17 -0800 (PST)
Date: Tue, 4 Jan 2022 10:34:15 +0100
From: Igor Mammedov <imammedo@redhat.com>
To: Daniil Tatianin <d-tatianin@yandex-team.ru>
Subject: Re: [PATCH v1] hw/smbios: verify header type for file before using it
Message-ID: <20220104103415.49b14493@redhat.com>
In-Reply-To: <20211129135211.1114466-1-d-tatianin@yandex-team.ru>
References: <20211129135211.1114466-1-d-tatianin@yandex-team.ru>
X-Mailer: Claws Mail 4.0.0 (GTK+ 3.24.30; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=imammedo@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=imammedo@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -12
X-Spam_score: -1.3
X-Spam_bar: -
X-Spam_report: (-1.3 / 5.0 requ) DKIMWL_WL_HIGH=-0.37, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Cc: ani@anisinha.ca, qemu-devel@nongnu.org, yc-core@yandex-team.ru,
 mst@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Mon, 29 Nov 2021 16:52:11 +0300
Daniil Tatianin <d-tatianin@yandex-team.ru> wrote:

here should be more verbose description of the issue
preferably with a way to reproduce it.
and what/why patch does what it does.

> Signed-off-by: Daniil Tatianin <d-tatianin@yandex-team.ru>
> ---
>  hw/smbios/smbios.c | 6 ++++++
>  1 file changed, 6 insertions(+)
> 
> diff --git a/hw/smbios/smbios.c b/hw/smbios/smbios.c
> index 7397e56737..c55f77368a 100644
> --- a/hw/smbios/smbios.c
> +++ b/hw/smbios/smbios.c
> @@ -1163,6 +1163,12 @@ void smbios_entry_add(QemuOpts *opts, Error **errp)
>              return;
>          }
>  
> +        if (header->type > SMBIOS_MAX_TYPE) {
> +            error_setg(errp,
> +                       "invalid header type %d!", header->type);

3.0 spec says that types over 127 are valid and for use by OEM/etc,
but QEMU doesn't support anything over 127 due to limited size of
have_fields_bitmap.
So I'd rephrase it as "unsupported header type"

> +            return;
> +        }
> +
>          if (test_bit(header->type, have_fields_bitmap)) {
>              error_setg(errp,
>                         "can't load type %d struct, fields already specified!",


