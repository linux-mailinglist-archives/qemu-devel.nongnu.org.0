Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3903E4CDC59
	for <lists+qemu-devel@lfdr.de>; Fri,  4 Mar 2022 19:26:04 +0100 (CET)
Received: from localhost ([::1]:40272 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nQCct-0003Bv-9X
	for lists+qemu-devel@lfdr.de; Fri, 04 Mar 2022 13:26:03 -0500
Received: from eggs.gnu.org ([209.51.188.92]:44818)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jsnow@redhat.com>) id 1nQCaY-0000gh-7f
 for qemu-devel@nongnu.org; Fri, 04 Mar 2022 13:23:38 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:46698)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jsnow@redhat.com>) id 1nQCaW-0001Ar-5W
 for qemu-devel@nongnu.org; Fri, 04 Mar 2022 13:23:37 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1646418215;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=nn1SHia3YYqhZR3P3a9YurCS3OGwjzPrQuxvK8nb6oM=;
 b=E2yB7200TocX8jkOF1+t9Jpy0bhvRg14QziSUD6+/1UmkAnySZtjUhzOmAFc45LB+WjYCM
 saIHUp8MtT9F+/a46/fFzJFTc5PNObuvbkNRqZ89zHPsEcvdwwNr5evm6PhyF1tNAoqViY
 fxyvNSO6PSrx/6z2yiFPR2JjGT5xkqw=
Received: from mail-ua1-f70.google.com (mail-ua1-f70.google.com
 [209.85.222.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-523-ESj_siN4P3i30PPVm4eLew-1; Fri, 04 Mar 2022 13:23:33 -0500
X-MC-Unique: ESj_siN4P3i30PPVm4eLew-1
Received: by mail-ua1-f70.google.com with SMTP id
 l5-20020ab03d85000000b0034ac8e179c3so2544051uac.0
 for <qemu-devel@nongnu.org>; Fri, 04 Mar 2022 10:23:33 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=nn1SHia3YYqhZR3P3a9YurCS3OGwjzPrQuxvK8nb6oM=;
 b=skwlx5OzO5JZooX3xmlJ3TE0g2I+mAPI8BQbAgeS7tJ6DNJNdxv2aIBqoOCICl00NM
 8psim9GkSfgwXwDRXJ5XHwE4NA/cHWgeoerhqk13ds1taclWkdH4I4VXfVD40+lBL+Wu
 zD95i8yDMTVag6eUqot1bcHnQZtrtKffsAfbpKf2gGtX9vylYNaZASSrFbnBU78/7ttF
 exBni7XY0o3RsCAcePaLucx9N/pPaO5nkkwG7mSxesCPfDTHkbR38AzGC1QGS+8JxSbO
 5wu3ftbntSisj6TftmazOclsxPg74cxfccm5Ti+LLjmn30FImZ3O8juiXCNfq0DOaRO1
 VEXg==
X-Gm-Message-State: AOAM530Fl5Qg2UPHTo3MGUwRNMNyiCtFAS6RxyCh828VSZ5jdwEhUteF
 e3bq5ruEH4aKUwikPG74Arh86uiJUXr6jpyHARXJXvpGW7zX5oklv7Nw9QW0DIwzDmmmTrd7uQw
 mONfdTcpxLn11oNsL7mA5edoY7qhynE0=
X-Received: by 2002:a05:6122:17a6:b0:31e:d699:29e0 with SMTP id
 o38-20020a05612217a600b0031ed69929e0mr19388054vkf.1.1646418213024; 
 Fri, 04 Mar 2022 10:23:33 -0800 (PST)
X-Google-Smtp-Source: ABdhPJy+nLaX/uenUJFsCH778W5fVkS9V//08bvPN95nf8WBTVE5lC0Ne56wGw67fqtd/pb8Y7EBjlAQ1CYkX9SSRuw=
X-Received: by 2002:a05:6122:17a6:b0:31e:d699:29e0 with SMTP id
 o38-20020a05612217a600b0031ed69929e0mr19388045vkf.1.1646418212868; Fri, 04
 Mar 2022 10:23:32 -0800 (PST)
MIME-Version: 1.0
References: <20220225205948.3693480-1-jsnow@redhat.com>
 <20220225205948.3693480-10-jsnow@redhat.com>
 <YiJT30Ibq9ncb/Kt@redhat.com>
In-Reply-To: <YiJT30Ibq9ncb/Kt@redhat.com>
From: John Snow <jsnow@redhat.com>
Date: Fri, 4 Mar 2022 13:23:22 -0500
Message-ID: <CAFn=p-ZLdHBxeSRWYU9xP00mHASf9=omLG0n3SepKtuUhZoteA@mail.gmail.com>
Subject: Re: [PATCH 09/10] python/aqmp: fix race condition in legacy.py
To: =?UTF-8?Q?Daniel_P=2E_Berrang=C3=A9?= <berrange@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=jsnow@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=170.10.129.124; envelope-from=jsnow@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H5=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
Cc: Kevin Wolf <kwolf@redhat.com>, Peter Maydell <peter.maydell@linaro.org>,
 Cleber Rosa <crosa@redhat.com>, qemu-devel <qemu-devel@nongnu.org>,
 Beraldo Leal <bleal@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Fri, Mar 4, 2022 at 1:01 PM Daniel P. Berrang=C3=A9 <berrange@redhat.com=
> wrote:
>
> On Fri, Feb 25, 2022 at 03:59:47PM -0500, John Snow wrote:
> > With all of that refactoring out of the way, this is extraordinarily
> > simple.
>
> I think it'd be useful to explain in some detail what the
> race condition was, because 1 year later no one will
> remember what scenario we were fixing here.
>

OK, not a problem. Thanks for the reviews thus far.

[...]


