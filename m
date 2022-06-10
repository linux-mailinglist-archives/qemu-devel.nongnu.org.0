Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4F8315462FD
	for <lists+qemu-devel@lfdr.de>; Fri, 10 Jun 2022 12:00:26 +0200 (CEST)
Received: from localhost ([::1]:44722 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nzbRJ-0003ET-C0
	for lists+qemu-devel@lfdr.de; Fri, 10 Jun 2022 06:00:25 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:39206)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ani@anisinha.ca>) id 1nzZrM-0001WP-Nv
 for qemu-devel@nongnu.org; Fri, 10 Jun 2022 04:19:13 -0400
Received: from mail-ej1-x62f.google.com ([2a00:1450:4864:20::62f]:40838)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <ani@anisinha.ca>) id 1nzZrK-0000yU-Qe
 for qemu-devel@nongnu.org; Fri, 10 Jun 2022 04:19:12 -0400
Received: by mail-ej1-x62f.google.com with SMTP id fu3so50519389ejc.7
 for <qemu-devel@nongnu.org>; Fri, 10 Jun 2022 01:19:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=anisinha-ca.20210112.gappssmtp.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=MUGqmAcATXg2tyQqJBNt09m4VEsuXSeFPWdBV+XrTM8=;
 b=TYqOTfhvtaf8Jbqavxh9C/CWjEYptm0OgHxcudqlxrgkxT7FjKJWRAc8lkqOdXXGJ/
 DPAuM3M4a4l6T7tpYRga0CNCcd8jizR3jSKaA76lkj55EaL++EMeSwsQWqlYSdyGhZvp
 HVSiNHAhoEAmWG6a2B5rxR2Guqjbyd+YusvEXNTiiqzjSWCzljCLS5HTLf19xA8d9RIt
 Wq92Vg/F8pciPU/T1Ga0/Jh64OrN/fFs6hc9717iaihUaubV8WYkANykRu4s6ly2QPdL
 OqNVu+Wfw4OH4qu7taam0c49Gr+g429bt57/ScFAa/diIJlV4n1KXEdQd0jlhid44Xqv
 7t8g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=MUGqmAcATXg2tyQqJBNt09m4VEsuXSeFPWdBV+XrTM8=;
 b=tdmTFV0HjLP52PsM/nfBxKFPC+wg+eno/PBv/VZqmEEFZvsU1e2l2oFSwLwNDiUYhg
 whvkFONB3BPgZqjsNQ6eiJkZS8z9CBFbF0SNgQUFB2b7hlDgTW7KTI4mQNe1Zw0+D6Nw
 E9EFvRa1NrRpfdj7sgkR5VVTXvzb6FYyXo87kqHOoEF86I3WBs7AlIcasjpr5Tz5lv6u
 PutaIDj+4oywZCNAran32YOkkPVOLSjXBzLtSXx0C62xgw8QeB3HBWapDO1qFkfYdsEm
 4tD+2L9hgvD/5LQ54wCQB6KiVEb2Vera6HrWjUsihN9tp0pTBfkC8tPpY/wv+1zjpCLA
 OsgA==
X-Gm-Message-State: AOAM533cmSz6A/mc7z44A30SKws4zBhSXgTDSFy5F5yHGnDAhxZQYxlp
 ISqnAaZmQXWEDtpAFpjMVCW4jA+NXjItzhGVMOo6Ag==
X-Google-Smtp-Source: ABdhPJyXhcgUGzvbYrjvWV395VeCfYZhMgtG2JfnO09fee177pEWVXYl6/aPO1RuMzNFq/nF5DaICjzbwWQ8ONtoqbA=
X-Received: by 2002:a17:906:53c7:b0:711:d2e9:99d4 with SMTP id
 p7-20020a17090653c700b00711d2e999d4mr20820504ejo.716.1654849148595; Fri, 10
 Jun 2022 01:19:08 -0700 (PDT)
MIME-Version: 1.0
References: <20220513141005.1929422-1-ani@anisinha.ca>
 <2b64c7b3-a18c-b764-3854-cb14a7432f88@oracle.com>
In-Reply-To: <2b64c7b3-a18c-b764-3854-cb14a7432f88@oracle.com>
From: Ani Sinha <ani@anisinha.ca>
Date: Fri, 10 Jun 2022 13:48:57 +0530
Message-ID: <CAARzgwweNOJjoRpGSfvu2kh74207JszXduCqg3rkx+Y7S7c62Q@mail.gmail.com>
Subject: Re: [PATCH] acpi/erst: fix fallthrough code upon validation failure
To: Eric DeVolder <eric.devolder@oracle.com>
Cc: "Michael S. Tsirkin" <mst@redhat.com>, Igor Mammedov <imammedo@redhat.com>,
 Peter Maydell <peter.maydell@linaro.org>, qemu-devel@nongnu.org
Content-Type: text/plain; charset="UTF-8"
Received-SPF: none client-ip=2a00:1450:4864:20::62f;
 envelope-from=ani@anisinha.ca; helo=mail-ej1-x62f.google.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_NONE=0.001, T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Thu, May 19, 2022 at 6:35 PM Eric DeVolder <eric.devolder@oracle.com> wrote:
>
>
>
> On 5/13/22 09:10, Ani Sinha wrote:
> > At any step when any validation fail in check_erst_backend_storage(), there is
> > no need to continue further through other validation checks. Further, by
> > continuing even when record_size is 0, we run the risk of triggering a divide
> > by zero error if we continued with other validation checks. Hence, we should
> > simply return from this function upon validation failure.
> >
> > CC: Peter Maydell <peter.maydell@linaro.org>
> > CC: Eric DeVolder <eric.devolder@oracle.com>
> > Signed-off-by: Ani Sinha <ani@anisinha.ca>
>
> Reviewed-by: Eric DeVolder <eric.devolder@oracle.com>

Michael:
Did you forget to queue this for your latest pull request?


>
> My apologies, I've been away for the past week.
> Thank you for taking the time to correct this issue!
> eric
>
> > ---
> >   hw/acpi/erst.c | 3 +++
> >   1 file changed, 3 insertions(+)
> >
> > diff --git a/hw/acpi/erst.c b/hw/acpi/erst.c
> > index de509c2b48..df856b2669 100644
> > --- a/hw/acpi/erst.c
> > +++ b/hw/acpi/erst.c
> > @@ -440,6 +440,7 @@ static void check_erst_backend_storage(ERSTDeviceState *s, Error **errp)
> >           (record_size >= 4096) /* PAGE_SIZE */
> >           )) {
> >           error_setg(errp, "ERST record_size %u is invalid", record_size);
> > +        return;
> >       }
> >
> >       /* Validity check header */
> > @@ -450,6 +451,7 @@ static void check_erst_backend_storage(ERSTDeviceState *s, Error **errp)
> >           (le16_to_cpu(header->reserved) == 0)
> >           )) {
> >           error_setg(errp, "ERST backend storage header is invalid");
> > +        return;
> >       }
> >
> >       /* Check storage_size against record_size */
> > @@ -457,6 +459,7 @@ static void check_erst_backend_storage(ERSTDeviceState *s, Error **errp)
> >            (record_size > s->storage_size)) {
> >           error_setg(errp, "ACPI ERST requires storage size be multiple of "
> >               "record size (%uKiB)", record_size);
> > +        return;
> >       }
> >
> >       /* Compute offset of first and last record storage slot */
> >

