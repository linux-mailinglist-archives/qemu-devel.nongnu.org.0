Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7E3D6387BAE
	for <lists+qemu-devel@lfdr.de>; Tue, 18 May 2021 16:51:06 +0200 (CEST)
Received: from localhost ([::1]:34998 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lj13n-0006xB-2D
	for lists+qemu-devel@lfdr.de; Tue, 18 May 2021 10:51:03 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:52544)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mapfelba@redhat.com>)
 id 1lj0u9-0004lH-0G
 for qemu-devel@nongnu.org; Tue, 18 May 2021 10:41:05 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:43852)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mapfelba@redhat.com>)
 id 1lj0u3-0000cu-NK
 for qemu-devel@nongnu.org; Tue, 18 May 2021 10:41:04 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1621348857;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:in-reply-to:in-reply-to:  references:references;
 bh=biCCHbHs2MKgmLaq4/Xceqpb8rt/xyCypvJ0GkP4f7U=;
 b=GQXMnA8uk/7CFLhTcmpg9aP7+1PGT5o4zToB/o9CBZ8j/0LMzY3l+PFtu6ZEhotPrGXh+S
 ux+QL5bjogV52d6SDh9CuXqThGggxY8892iEf+h7QJMNRduONrVXjSAyTMLIntR+vZ7AOE
 Ua8RN/em/KNBOD1ZkbdVRPz1gEDm+zs=
Received: from mail-ej1-f69.google.com (mail-ej1-f69.google.com
 [209.85.218.69]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-174-QkMzXtQfOHODnpDtS5pjNw-1; Tue, 18 May 2021 10:39:43 -0400
X-MC-Unique: QkMzXtQfOHODnpDtS5pjNw-1
Received: by mail-ej1-f69.google.com with SMTP id
 i23-20020a17090685d7b02903d089ab83fcso2455925ejy.19
 for <qemu-devel@nongnu.org>; Tue, 18 May 2021 07:39:43 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:reply-to
 :from:date:message-id:subject:to:cc;
 bh=biCCHbHs2MKgmLaq4/Xceqpb8rt/xyCypvJ0GkP4f7U=;
 b=pP+GXO8WAbmiNTcaL6GP7txS1jS867DbAIaiBq7MYHD+4R2sCAykcwT3uV7+Jx3KmN
 vDfUCgIb+a0tOrFFmD1+pww/gm1BXzTj3atQCExhkIWIrjzXhwYECqEC3jcCh3OeQIdv
 1O+hapCQTFjqFk84NoNmYsFzXw3OYzIzlQpUVrjTZTEevEF3KWg0C8MMaqV0HVaoF/KE
 TvwBwN15pqhwyX3SMnfaI+ntS6Tyn2XgmkaBHYEE/KOR+yAdEvRhSEJmClygcWu29PKY
 n2qxQOgd7qHF3r9PZTHvPr1BXI4QOE7UKKTscgHAMWZnwa3vARseTx6oZMwGQr6ijjmW
 B7WA==
X-Gm-Message-State: AOAM532aDSDeJB/SJ9KASsiMzOk4pU39JVMQ7Wi+nt2EjjJxckNlLyE2
 U8b69Ol3YiG8JnY3liWFr3N76ZwggIMiARHQoz6kpuneW69rCTQVi5Nkx0QThEDX+lCrA40rRNk
 ORyzSL6DDsAQenCEf5pp++F4UPaEf3hk=
X-Received: by 2002:aa7:cd55:: with SMTP id v21mr7700479edw.344.1621348782704; 
 Tue, 18 May 2021 07:39:42 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJyPrpzJ7nnJ3OC4E8jHEN3dImIxhl6qT125/R+pcIj4y7SFJgrpRHBNao56Adc4D93Jmfqtoy3eQny5pbq6lFE=
X-Received: by 2002:aa7:cd55:: with SMTP id v21mr7700459edw.344.1621348782479; 
 Tue, 18 May 2021 07:39:42 -0700 (PDT)
MIME-Version: 1.0
References: <CADNu6esr-fzfP8pug+Rfv+yJrEjDJaGy3EO+O-oLb_nMm7qLDg@mail.gmail.com>
In-Reply-To: <CADNu6esr-fzfP8pug+Rfv+yJrEjDJaGy3EO+O-oLb_nMm7qLDg@mail.gmail.com>
From: Marcel Apfelbaum <mapfelba@redhat.com>
Date: Tue, 18 May 2021 17:39:31 +0300
Message-ID: <CA+aaKfB6BEbPnoRj07EfG_Yjpo5gvMLAiP-7=XLNAz0HL6RQDw@mail.gmail.com>
Subject: Re: Adding pcie-root-port devices via QMP apparently isn't possible
To: Thomas Parrott <thomas.parrott@canonical.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=mapfelba@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=216.205.24.124; envelope-from=mapfelba@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -31
X-Spam_score: -3.2
X-Spam_bar: ---
X-Spam_report: (-3.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.374,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Reply-To: marcel@redhat.com
Cc: Marcel Apfelbaum <marcel@redhat.com>, Julia Suvorova <jusual@redhat.com>,
 qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Hi Thomas,


On Tue, May 18, 2021 at 3:29 PM Thomas Parrott
<thomas.parrott@canonical.com> wrote:
>
> Due to QEMU moving towards a QMP configuration mechanism and away from config file support, the LXD team are currently in the process of migrating to using QMP to add devices to VMs (so that we can support the use of QEMU 6.0).
>
> Currently we are using the `-S` flag to freeze CPU at startup, then using QMP to add NIC devices via the `device_add` command, and then using the `cont` command to start the VM guest.
>
> However we have found that it is apparently not possible to add a pcie-root-port device via QMP.
>
> Initially we tried using something like:
>
> device_add {"id":"qemu_pcie5","driver":"pcie-root-port","bus":"pcie.0","addr":"1.5","chassis":5,"multifunction":"on"}
>
> Which was a straight conversion from the current config file we use.
>
> However this gave the error:
>
> Error: Bus 'pcie.0' does not support hotplugging
>
> Then I found the `--preconfig` flag which sounded interesting, so we removed the use of `-daemonize` which prevents the use of --preconfig` and then tried adding the pcie-root-port devices in the preconfig stage.
>
> But this resulted in the error:
>
> The command 'device_add' isn't permitted in 'preconfig' state
>
> So we wondered is this a bug, or if not, what is the correct way to be adding pcie-root-ports going forward?

The pcie-root-ports cannot be hot-plugged, you will need to
pre-allocate enough pcie-root-ports for your needs.
PCI(e) devices can be hot-plugged into the pre-allocated pcie-root-ports.

Thanks,
Marcel

>
> Thanks
> Tom Parrott
>
>


