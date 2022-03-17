Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4163E4DCA1D
	for <lists+qemu-devel@lfdr.de>; Thu, 17 Mar 2022 16:36:17 +0100 (CET)
Received: from localhost ([::1]:59674 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nUsAi-0002um-Cy
	for lists+qemu-devel@lfdr.de; Thu, 17 Mar 2022 11:36:16 -0400
Received: from eggs.gnu.org ([209.51.188.92]:50244)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jsnow@redhat.com>) id 1nUs5n-0006Wh-MG
 for qemu-devel@nongnu.org; Thu, 17 Mar 2022 11:31:11 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:56246)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jsnow@redhat.com>) id 1nUs5m-0003ac-8v
 for qemu-devel@nongnu.org; Thu, 17 Mar 2022 11:31:11 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1647531069;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=86jMFpM+Is6NzZEGLKqU3L3fkTeHQw/H40lNfNnTZXE=;
 b=af2uAj7A6BhElVZXZRqMY/Od8v/w4MaD6wO3nXEPr6VoKZ6iDxLMEDuPdVuCt+i0m7lHLT
 P9VN5TVY+zWYrAD7iCsvG4B/uwL/5YMntc4zWhrcRdSBIu8YSdxn6VEvFqvqm3izeIpOPd
 ZFAAp1rAFA5cFc2TUKBMnEtmHjOvB88=
Received: from mail-vk1-f197.google.com (mail-vk1-f197.google.com
 [209.85.221.197]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-193-uYIY-QjwNf2oKJ-zdtbceg-1; Thu, 17 Mar 2022 11:31:08 -0400
X-MC-Unique: uYIY-QjwNf2oKJ-zdtbceg-1
Received: by mail-vk1-f197.google.com with SMTP id
 a188-20020a1f66c5000000b0033e52f60923so552913vkc.7
 for <qemu-devel@nongnu.org>; Thu, 17 Mar 2022 08:31:07 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=86jMFpM+Is6NzZEGLKqU3L3fkTeHQw/H40lNfNnTZXE=;
 b=5v483Dcf7Ck+XU0uLnROMEHCUQn0gKbA6grodHyb12eoEBLMEAoOePdBEOh/W9qYaB
 UYkuwEAhNba5ChpT+fcg0Fh3N8fewbd9hBj8/rnLSLaXc1MkWJJeTjz8ZVq3KGkXIvJ+
 CL+yCANw8EyR/duBEnypMRs1Kwz7cQVB1q31TKO5tUAu+YB6aKgf9rVSk/xjLbWPeO4g
 VHcaRYTb2Od46ERtrvJR9TSIu4VGeb4m3vaMsUUYU+xO0AON2cgu/AJh3EFybjXtsYOP
 aL5dSrLo84VPapgsxjU7UjZEGK7BrILTvOhWO1leDw83sydrQMfrfeQFNl6Or92LOoA+
 t0jQ==
X-Gm-Message-State: AOAM530334hor8hJ6trjwKa1uzcs0ryogyqtmb+W780YpMBGobIDgg/i
 x3AtRZwZNz8vOmOScwTEZPLD9zRlbYsOz0MNsZPqOmuh8+8QX7QMwQ9XSBQdmtj8GXn1HxX5U68
 Sgaq7ts6hfiLTqy4I4Apscc/Gq9YcqyE=
X-Received: by 2002:a67:17c4:0:b0:322:cfd8:15a1 with SMTP id
 187-20020a6717c4000000b00322cfd815a1mr1800148vsx.61.1647531067462; 
 Thu, 17 Mar 2022 08:31:07 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwGoJoDhGq9tGzjGQ6Bmik922hyly/OvFqUD4IXYxMj440MLAI8RQm9ELcF2yfsUJ+AAzPLM7LXtJb+QLqcdNg=
X-Received: by 2002:a67:17c4:0:b0:322:cfd8:15a1 with SMTP id
 187-20020a6717c4000000b00322cfd815a1mr1800136vsx.61.1647531067302; Thu, 17
 Mar 2022 08:31:07 -0700 (PDT)
MIME-Version: 1.0
References: <20220309035407.1848654-1-jsnow@redhat.com>
 <20220309035407.1848654-2-jsnow@redhat.com>
 <813e9265-1920-1caf-0d07-39b20c7bb944@redhat.com>
 <CAFn=p-Z-jLo8XEZFuXHMYfEx+rRp7=3XDL08gBxXPuzAtp6yuA@mail.gmail.com>
 <887d60f2-7c5c-5d79-8cc7-8b21fd3b8373@redhat.com>
In-Reply-To: <887d60f2-7c5c-5d79-8cc7-8b21fd3b8373@redhat.com>
From: John Snow <jsnow@redhat.com>
Date: Thu, 17 Mar 2022 11:30:56 -0400
Message-ID: <CAFn=p-YxuVF16P19ZbyPdV3Zq+FOQ8hoULW+8a9-4XDcgtN0Gg@mail.gmail.com>
Subject: Re: [PATCH 01/14] iotests: add qemu_img_json()
To: Hanna Reitz <hreitz@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=jsnow@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=170.10.129.124; envelope-from=jsnow@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
Cc: Kevin Wolf <kwolf@redhat.com>, Eric Blake <eblake@redhat.com>,
 qemu-devel <qemu-devel@nongnu.org>, Qemu-block <qemu-block@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Thu, Mar 17, 2022 at 10:51 AM Hanna Reitz <hreitz@redhat.com> wrote:

> I hope similarly to how =D7=90=E2=80=8E=E2=82=80 and its companions exist=
[1], there are also
> multiple instances of `...`, so one can succeed at handling cases where
> a `...` is a valid return type.  I suggest just more dots.

lol.

I'm invested in higher-kinded ellipse theory.

--js


