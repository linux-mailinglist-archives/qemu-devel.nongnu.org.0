Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9147B493FA8
	for <lists+qemu-devel@lfdr.de>; Wed, 19 Jan 2022 19:11:31 +0100 (CET)
Received: from localhost ([::1]:35780 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nAFQg-00087c-8V
	for lists+qemu-devel@lfdr.de; Wed, 19 Jan 2022 13:11:30 -0500
Received: from eggs.gnu.org ([209.51.188.92]:57590)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <lsoaresp@redhat.com>)
 id 1nAFMW-0006e1-SM
 for qemu-devel@nongnu.org; Wed, 19 Jan 2022 13:07:12 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:40922)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <lsoaresp@redhat.com>)
 id 1nAFMU-0002b7-En
 for qemu-devel@nongnu.org; Wed, 19 Jan 2022 13:07:11 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1642615629;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=LFErzY26m0v2bJdMdj7xf3pOWQghuTqP3zjsBsWwfq4=;
 b=SCcnUnTNokm1zT0qtQONB2YiizEXWIeL0v2e/Q2RhlGY/6DtmZjnpBjTu/9RWcqvCohTLx
 UOjAmNPIBLAS2Ss1X4xEcrbEPssrNZ3p3y4RTfrQVVt2Su+qxvz2Gh4qZCnBUqxN1sUzJS
 wvpJTKYgB4utimlXAh9NXt+Dhzjnr34=
Received: from mail-ed1-f71.google.com (mail-ed1-f71.google.com
 [209.85.208.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-280-FFxEaUlaP1CxFeqb0Wa0EA-1; Wed, 19 Jan 2022 13:07:08 -0500
X-MC-Unique: FFxEaUlaP1CxFeqb0Wa0EA-1
Received: by mail-ed1-f71.google.com with SMTP id
 o10-20020a056402438a00b00403212b6b1aso3390032edc.13
 for <qemu-devel@nongnu.org>; Wed, 19 Jan 2022 10:07:08 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=LFErzY26m0v2bJdMdj7xf3pOWQghuTqP3zjsBsWwfq4=;
 b=aB/ToRAn4ivBxTwO+C6Bqb8J2gLuWBc3WtCt9/aA5YQ666vNIAIHZ78ToAhtKXZO7Q
 CvOOu1zs8HgdAUCTws+PBT+TEkDDieCl347Dtg6jUmwh4okTIhchAT4i+hrPEzcEKWYs
 mlD0qS+94r+PCV9u5WQoV/bFYv3PHMtyjnG2YZTRNapCtFL1IuAKbod8WhBhFCLPJoDq
 G9dkAO5wDjy4oj/AQszwl2zWG0F+EWaQih+8ZAI6PW4g/lKmVLIREzpydxqO26HMTowq
 f5K6dfFN1rgl8T2Xl7xu6Z9VqVRkmDFOnYS7wLp9hRyWEB59PcJhVAiqCXRTKX+Ysawz
 k3aQ==
X-Gm-Message-State: AOAM532EZg40FbsohSo9tEHWYUczvAF3ZxvPCSvM8p/gDDsCG5Um5kaj
 fAtCCk5FEERqXrMetS9oL/xrfh88rCzDZSXJE9OFJLwmoepuJV9LSaKCepW61AxfAx4pBuQlhc/
 YBOW+o1yurri9+cQC/jjZh0DXYtetwmA=
X-Received: by 2002:a05:6512:3397:: with SMTP id
 h23mr28763441lfg.370.1642615626976; 
 Wed, 19 Jan 2022 10:07:06 -0800 (PST)
X-Google-Smtp-Source: ABdhPJz2a4ul2oPwwjcqPiQf5DSS7UdK/d9CatgAEMTYs9LMThtLRxQdEbozEBEEG2gbJSnVTC6RgguM4eExPDSchm0=
X-Received: by 2002:a05:6512:3397:: with SMTP id
 h23mr28763419lfg.370.1642615626713; 
 Wed, 19 Jan 2022 10:07:06 -0800 (PST)
MIME-Version: 1.0
References: <20220106221341.8779-1-leobras@redhat.com>
 <20220106221341.8779-5-leobras@redhat.com>
 <Yd/OkqOA96rnGggo@xz-m1.local>
In-Reply-To: <Yd/OkqOA96rnGggo@xz-m1.local>
From: Leonardo Bras Soares Passos <leobras@redhat.com>
Date: Wed, 19 Jan 2022 15:06:55 -0300
Message-ID: <CAJ6HWG77dmtpwCsOC7CRaNRCYmFAqTRRxURSTw7ACG0p=Uy-Sw@mail.gmail.com>
Subject: Re: [PATCH v7 4/5] migration: Add migrate_use_tls() helper
To: Peter Xu <peterx@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=lsoaresp@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=170.10.133.124; envelope-from=lsoaresp@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.7,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: =?UTF-8?Q?Daniel_P=2E_Berrang=C3=A9?= <berrange@redhat.com>,
 Juan Quintela <quintela@redhat.com>, Markus Armbruster <armbru@redhat.com>,
 qemu-devel <qemu-devel@nongnu.org>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>, Eric Blake <eblake@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Hello Peter,

On Thu, Jan 13, 2022 at 4:02 AM Peter Xu <peterx@redhat.com> wrote:
>
> On Thu, Jan 06, 2022 at 07:13:41PM -0300, Leonardo Bras wrote:
> >  void migration_channel_process_incoming(QIOChannel *ioc)
> >  {
> > -    MigrationState *s = migrate_get_current();
> >      Error *local_err = NULL;
> >
> >      trace_migration_set_incoming_channel(
> >          ioc, object_get_typename(OBJECT(ioc)));
> >
> > -    if (s->parameters.tls_creds &&
> > -        *s->parameters.tls_creds &&
> > +    if (migrate_use_tls() &&
> >          !object_dynamic_cast(OBJECT(ioc),
> >                               TYPE_QIO_CHANNEL_TLS)) {
> > +        MigrationState *s = migrate_get_current();
> > +
>
> Trivial nit: I'd rather keep the line there; as the movement offers nothing,
> imho..

The idea to move the 's' to inside the if  block is to make it clear
it's only used in this case.

But if you think it's better to keep it at the beginning of the
function, sure, I can change that.
Just let me know.

>
> >          migration_tls_channel_process_incoming(s, ioc, &local_err);
> >      } else {
> >          migration_ioc_register_yank(ioc);
>
> Reviewed-by: Peter Xu <peterx@redhat.com>
>

Thanks!

> --
> Peter Xu
>

Best regards,
Leo


