Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C878E39FB1C
	for <lists+qemu-devel@lfdr.de>; Tue,  8 Jun 2021 17:45:00 +0200 (CEST)
Received: from localhost ([::1]:55268 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lqduV-0006nv-Gp
	for lists+qemu-devel@lfdr.de; Tue, 08 Jun 2021 11:44:59 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:53020)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1lqdt7-0005rw-3s
 for qemu-devel@nongnu.org; Tue, 08 Jun 2021 11:43:33 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:33488)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1lqdt5-0003LW-PE
 for qemu-devel@nongnu.org; Tue, 08 Jun 2021 11:43:32 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1623167011;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=ak7KE6SsAlXwA5SW0eMXDPVZwmz3BYbLWfKjOCNHXKs=;
 b=G4D0TzvpklXiGxGXrDspP7Oa889b8C45gZVT+hHqS94s+EoOZkwsD0bygB06D4o8dB4LJL
 uGBBHabqzEymrbUcu3HtCaxb6Ert19DGBFUZNyYVyiTxxIY4Ka3nKsHdVrWvngy5FB1Svd
 qVI4d6cQ9nDgHI2sMYmlTtdjOq5AevA=
Received: from mail-ej1-f70.google.com (mail-ej1-f70.google.com
 [209.85.218.70]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-265-1VOPN96WMvCmL36t3pvwIg-1; Tue, 08 Jun 2021 11:43:29 -0400
X-MC-Unique: 1VOPN96WMvCmL36t3pvwIg-1
Received: by mail-ej1-f70.google.com with SMTP id
 ji22-20020a1709079816b0290414bdf5da11so2540116ejc.9
 for <qemu-devel@nongnu.org>; Tue, 08 Jun 2021 08:43:29 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=ak7KE6SsAlXwA5SW0eMXDPVZwmz3BYbLWfKjOCNHXKs=;
 b=Mi/6Wt8jsTPw8EHdPJ7qGDyHzHqJu2hqTM1EGwHwHcaF/ioekgm2CAGbDaQh7vR/dH
 nYD3trTwgNdI/cdGb/9Rgd5hH4TRg4Lbup+VfvnLXc+4UmnD4/yBXSeQXDfePJ4M+hGg
 y3qXovoRV1AAH3ihwlwJWlJKSNun06rYjr6aEEKdxi/e3Nz7kbihE8xJrzu7O2bjOPZ0
 +bLPd4GuQhwB0Fymsce3yqXdCuouvadOpN1I/J7iEHJcONjHXFsz/TQ6WNTVlnyw9cHW
 ukSUNks0DWpG29JxE6KdV+6qGAmmrT2HtJ/VXoiqQ4Lq6tnj2D9/YN/Cy0OVTtJPgGFS
 4org==
X-Gm-Message-State: AOAM5333Ngz//iIL7hgPaIPv+VjUFTQcfi3dr5x//2yAhvCgYIsoYYN2
 Wf2VxXNMpJ4aHlrkwBUTHfXvCGHYdnUE1NFBv/HpXMe/jVrGIzarl6FhtnY96xnU8VFhgGEMD/1
 s0PmDsqDooCQI7xse7ECg6uThPrpxy/Y=
X-Received: by 2002:a17:906:85d5:: with SMTP id
 i21mr22119112ejy.360.1623167008657; 
 Tue, 08 Jun 2021 08:43:28 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzqxj77vU1JutyE47GF4UTB7Sm67N3FeDHxGXkCuAP3QH33sXRznJ0BrlW3TtL/thJ8fEP+p+EHXEjismMPNxY=
X-Received: by 2002:a17:906:85d5:: with SMTP id
 i21mr22119092ejy.360.1623167008475; 
 Tue, 08 Jun 2021 08:43:28 -0700 (PDT)
MIME-Version: 1.0
References: <20210604155312.15902-1-alex.bennee@linaro.org>
 <20210604155312.15902-3-alex.bennee@linaro.org>
 <87r1hcwegq.fsf@dusky.pond.sub.org>
In-Reply-To: <87r1hcwegq.fsf@dusky.pond.sub.org>
From: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@redhat.com>
Date: Tue, 8 Jun 2021 17:43:17 +0200
Message-ID: <CAP+75-VQn81us+fX9RZW4sOdjxYX8nEY6GBNv+FMrOWaqBTZZw@mail.gmail.com>
Subject: Re: [PATCH v16 02/99] accel: Introduce 'query-accels' QMP command
To: Markus Armbruster <armbru@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=philmd@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=216.205.24.124; envelope-from=philmd@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -29
X-Spam_score: -3.0
X-Spam_bar: ---
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.197,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Cc: Eduardo Habkost <ehabkost@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 QEMU Developers <qemu-devel@nongnu.org>, qemu-arm <qemu-arm@nongnu.org>,
 Paolo Bonzini <pbonzini@redhat.com>,
 =?UTF-8?B?QWxleCBCZW5uw6ll?= <alex.bennee@linaro.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Tue, Jun 8, 2021 at 5:42 PM Markus Armbruster <armbru@redhat.com> wrote:
> Alex Benn=C3=A9e <alex.bennee@linaro.org> writes:

> > Reviewed-by: Eric Blake <eblake@redhat.com>
> > Reviewed-by: Alex Benn=C3=A9e <alex.bennee@linaro.org>
> > Tested-by: Alex Benn=C3=A9e <alex.bennee@linaro.org>
> > Signed-off-by: Philippe Mathieu-Daud=C3=A9 <philmd@redhat.com>
> > Signed-off-by: Alex Benn=C3=A9e <alex.bennee@linaro.org>
> > Message-Id: <20210505125806.1263441-3-philmd@redhat.com>
>
> I assume this one's superseded by Phil's "[PATCH v8 02/12] accel:
> Introduce 'query-accels' QMP command", i.e. I should review that one,
> not this one.

Correct.


