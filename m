Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3C58C5383B9
	for <lists+qemu-devel@lfdr.de>; Mon, 30 May 2022 16:42:54 +0200 (CEST)
Received: from localhost ([::1]:53298 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nvgbd-0006fL-By
	for lists+qemu-devel@lfdr.de; Mon, 30 May 2022 10:42:53 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:49164)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <quintela@redhat.com>)
 id 1nvgaN-0005aB-A9
 for qemu-devel@nongnu.org; Mon, 30 May 2022 10:41:35 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:31441)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <quintela@redhat.com>)
 id 1nvgaJ-0002CA-VR
 for qemu-devel@nongnu.org; Mon, 30 May 2022 10:41:33 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1653921691;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=cxzJ0Q0Pgy8D7hAm6K1TWOjdF0JrXg7wW1lby0AGORQ=;
 b=cKSgoRi/vJRufQYtNdHeDA4T5eC+j3BrE2DKzrQa+YBYI8mM4lUpGg7yivXdBslddAk1S6
 5kuBLkbyF39ZghJ5gES+/loqh2PaL+6RH2v14IEt0HOsoZaIE3MkpgaZ1WIjKvSHXqZHFl
 Bhe+/V2i0zkepgIBcqkNFyUTF29D5rc=
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com
 [209.85.128.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-212-AcdbjtQPMSmipISpMBgx6A-1; Mon, 30 May 2022 10:41:29 -0400
X-MC-Unique: AcdbjtQPMSmipISpMBgx6A-1
Received: by mail-wm1-f71.google.com with SMTP id
 m10-20020a05600c3b0a00b003948b870a8dso9867079wms.2
 for <qemu-devel@nongnu.org>; Mon, 30 May 2022 07:41:29 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:in-reply-to:references
 :user-agent:reply-to:date:message-id:mime-version
 :content-transfer-encoding;
 bh=cxzJ0Q0Pgy8D7hAm6K1TWOjdF0JrXg7wW1lby0AGORQ=;
 b=GOgGqDYTL22QrBgUykf/F/xt4y4K5rcKYgg5ZZ7jw+H7nMhgwM0yWXoBdUmlQ+/nPK
 HLcByT3zkma8fuWPSNm+Zgy2bJtnxP6vHDDPE++p7ZiDjx9rXHvPIULf291SKTZ2dYQn
 AsX/r8gYzWSnMYaQlvfOmSQ+nBd7FunaXaoFpg9qM5tpmixbyTps5/iv+477PcBKrYHL
 X+0Vfsz+c47Ib0WN8kyXLBKbOywvgHEtX0qzaiTWo7ZJy/WQQRka5M5Dj2gDHl5D/wFZ
 e8UgtI4jqRvDso4UHqgwGceBvbMahJPiNlyy4R1gpl0h7dJkql7IGMg/+SMDE9yci26N
 FG5A==
X-Gm-Message-State: AOAM530u9ku8oQAWo/xNN2Mj2EVZdPivSYWJsrTV+zzYOVLx+5h4yumq
 cOzwksCbUxVuxPxmBso9w+3XAWKZHvc57s65C0z3oaVht1HJcwnDRB7GIdaEHOxGoot11fnumZB
 e0T33eyz0i899JRY=
X-Received: by 2002:adf:fc01:0:b0:20c:ff9a:2c53 with SMTP id
 i1-20020adffc01000000b0020cff9a2c53mr45591979wrr.142.1653921688662; 
 Mon, 30 May 2022 07:41:28 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJx6pQ4fw6qSZ69vO4nixslQF8k41PWQhOvPaH2ZdAQuivfLDOIgMHzThO+DMptr4a1cI+J0NA==
X-Received: by 2002:adf:fc01:0:b0:20c:ff9a:2c53 with SMTP id
 i1-20020adffc01000000b0020cff9a2c53mr45591924wrr.142.1653921688366; 
 Mon, 30 May 2022 07:41:28 -0700 (PDT)
Received: from localhost (static-88-175-6-89.ipcom.comunitel.net.
 [89.6.175.88]) by smtp.gmail.com with ESMTPSA id
 r2-20020a7bc082000000b0039744664af7sm10615552wmh.1.2022.05.30.07.41.27
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 30 May 2022 07:41:27 -0700 (PDT)
From: Juan Quintela <quintela@redhat.com>
To: marcandre.lureau@redhat.com
Cc: qemu-devel@nongnu.org,  Daniel P. =?utf-8?Q?Berrang=C3=A9?=
 <berrange@redhat.com>,
 Alexander Bulekov <alxndr@bu.edu>,  Paolo Bonzini <pbonzini@redhat.com>,
 Bandan Das <bsd@redhat.com>,  Stefan Hajnoczi <stefanha@redhat.com>,
 Thomas Huth <thuth@redhat.com>,  Darren Kenny <darren.kenny@oracle.com>,
 Qiuhao Li <Qiuhao.Li@outlook.com>,  Gerd Hoffmann <kraxel@redhat.com>,
 Laurent Vivier <lvivier@redhat.com>,  "Michael S. Tsirkin"
 <mst@redhat.com>,  Igor Mammedov <imammedo@redhat.com>,  Ani Sinha
 <ani@anisinha.ca>,  John Snow <jsnow@redhat.com>,  Fam Zheng
 <fam@euphon.net>,  Peter Maydell <peter.maydell@linaro.org>,  =?utf-8?Q?C?=
 =?utf-8?Q?=C3=A9dric?= Le
 Goater <clg@kaod.org>,  Andrew Jeffery <andrew@aj.id.au>,  Joel Stanley
 <joel@jms.id.au>,  Dmitry Fleytman <dmitry.fleytman@gmail.com>,  Hannes
 Reinecke <hare@suse.com>,  Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?=
 <f4bug@amsat.org>,  Bin
 Meng <bin.meng@windriver.com>,  Su Hang <suhang16@mails.ucas.ac.cn>,
 Daniel Henrique Barboza <danielhb413@gmail.com>,  David Gibson
 <david@gibson.dropbear.id.au>,  Greg Kurz <groug@kaod.org>,  Coiby Xu
 <Coiby.Xu@gmail.com>,  "Dr. David Alan Gilbert" <dgilbert@redhat.com>,
 Havard Skinnemoen <hskinnemoen@google.com>,  Tyrone Ting
 <kfting@nuvoton.com>,  Keith Busch <kbusch@kernel.org>,  Klaus Jensen
 <its@irrelevant.dk>,  Markus Armbruster <armbru@redhat.com>,  Zhang Chen
 <chen.zhang@intel.com>,  Li Zhijian <lizhijian@fujitsu.com>,  Stefan
 Berger <stefanb@linux.vnet.ibm.com>,  Amit Shah <amit@kernel.org>,  Vikram
 Garhwal <fnu.vikram@xilinx.com>,  Francisco Iglesias
 <francisco.iglesias@xilinx.com>,  Michael Roth <michael.roth@amd.com>,
 qemu-block@nongnu.org (open list:IDE),  qemu-arm@nongnu.org (open
 list:ARM TCG CPUs),  qemu-ppc@nongnu.org (open list:sPAPR (pseries))
Subject: Re: [PATCH v2 05/26] tests: move libqtest.h back under qtest/
In-Reply-To: <20220426092715.3931705-6-marcandre.lureau@redhat.com> (marcandre
 lureau's message of "Tue, 26 Apr 2022 13:26:54 +0400")
References: <20220426092715.3931705-1-marcandre.lureau@redhat.com>
 <20220426092715.3931705-6-marcandre.lureau@redhat.com>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/27.2 (gnu/linux)
Date: Mon, 30 May 2022 16:41:27 +0200
Message-ID: <87h757qe08.fsf@secure.mitica>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=170.10.133.124; envelope-from=quintela@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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
Reply-To: quintela@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

marcandre.lureau@redhat.com wrote:
> From: Marc-Andr=C3=A9 Lureau <marcandre.lureau@redhat.com>
>
> Since commit a2ce7dbd917 ("meson: convert tests/qtest to meson"),
> libqtest.h is under libqos/ directory, while libqtest.c is still in
> qtest/. Move back to its original location to avoid mixing with libqos/.
>
> Suggested-by: Thomas Huth <thuth@redhat.com>
> Signed-off-by: Marc-Andr=C3=A9 Lureau <marcandre.lureau@redhat.com>
> Reviewed-by: Thomas Huth <thuth@redhat.com>

Reviewed-by: Juan Quintela <quintela@redhat.com>


