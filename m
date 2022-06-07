Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2174753FB7B
	for <lists+qemu-devel@lfdr.de>; Tue,  7 Jun 2022 12:38:07 +0200 (CEST)
Received: from localhost ([::1]:46706 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nyWb8-0003E4-5P
	for lists+qemu-devel@lfdr.de; Tue, 07 Jun 2022 06:38:06 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:37394)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jonathan.cameron@huawei.com>)
 id 1nyW2x-0007gk-Pt
 for qemu-devel@nongnu.org; Tue, 07 Jun 2022 06:02:50 -0400
Received: from frasgout.his.huawei.com ([185.176.79.56]:2599)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jonathan.cameron@huawei.com>)
 id 1nyW2v-0005rS-GT
 for qemu-devel@nongnu.org; Tue, 07 Jun 2022 06:02:47 -0400
Received: from fraeml737-chm.china.huawei.com (unknown [172.18.147.226])
 by frasgout.his.huawei.com (SkyGuard) with ESMTP id 4LHQlP5Z5Lz687LX;
 Tue,  7 Jun 2022 17:57:53 +0800 (CST)
Received: from lhreml710-chm.china.huawei.com (10.201.108.61) by
 fraeml737-chm.china.huawei.com (10.206.15.218) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.24; Tue, 7 Jun 2022 12:02:35 +0200
Received: from localhost (10.202.226.42) by lhreml710-chm.china.huawei.com
 (10.201.108.61) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.24; Tue, 7 Jun
 2022 11:02:34 +0100
Date: Tue, 7 Jun 2022 11:02:33 +0100
To: Ben Widawsky <bwidawsk@kernel.org>
CC: Paolo Bonzini <pbonzini@redhat.com>, <qemu-devel@nongnu.org>, "Michael S .
 Tsirkin" <mst@redhat.com>, <linux-cxl@vger.kernel.org>,
 <linuxarm@huawei.com>, <alex.bennee@linaro.org>, Marcel Apfelbaum
 <marcel@redhat.com>, Igor Mammedov <imammedo@redhat.com>, Markus Armbruster
 <armbru@redhat.com>, Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>, "Adam
 Manzanares" <a.manzanares@samsung.com>, Tong Zhang <ztong0001@gmail.com>,
 Shameerali Kolothum Thodi <shameerali.kolothum.thodi@huawei.com>
Subject: Re: [PATCH 1/8] hw/cxl: Make the CXL fixed memory window setup a
 machine parameter.
Message-ID: <20220607110233.00007d21@Huawei.com>
In-Reply-To: <20220606172338.3g6rb6qft4o5cu2o@bwidawsk-mobl5>
References: <20220530134514.31664-1-Jonathan.Cameron@huawei.com>
 <20220530134514.31664-2-Jonathan.Cameron@huawei.com>
 <cdb07cb9-4705-5b63-4f40-a44a6f735f38@redhat.com>
 <20220606172338.3g6rb6qft4o5cu2o@bwidawsk-mobl5>
Organization: Huawei Technologies Research and Development (UK) Ltd.
X-Mailer: Claws Mail 4.0.0 (GTK+ 3.24.29; i686-w64-mingw32)
MIME-Version: 1.0
Content-Type: text/plain; charset="US-ASCII"
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.202.226.42]
X-ClientProxiedBy: lhreml732-chm.china.huawei.com (10.201.108.83) To
 lhreml710-chm.china.huawei.com (10.201.108.61)
X-CFilter-Loop: Reflected
Received-SPF: pass client-ip=185.176.79.56;
 envelope-from=jonathan.cameron@huawei.com; helo=frasgout.his.huawei.com
X-Spam_score_int: -25
X-Spam_score: -2.6
X-Spam_bar: --
X-Spam_report: (-2.6 / 5.0 requ) BAYES_00=-1.9, RCVD_IN_DNSWL_LOW=-0.7,
 RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
Reply-to:  Jonathan Cameron <Jonathan.Cameron@Huawei.com>
From:  Jonathan Cameron via <qemu-devel@nongnu.org>

On Mon, 6 Jun 2022 10:24:43 -0700
Ben Widawsky <bwidawsk@kernel.org> wrote:

> On 22-05-31 09:26:27, Paolo Bonzini wrote:
> > On 5/30/22 15:45, Jonathan Cameron via wrote:  
> > > +    object_property_add(obj, "cxl-fmw", "CXLFixedMemoryWindow",
> > > +                        machine_get_cfmw, machine_set_cfmw,
> > > +                        NULL, state);
> > > +    object_property_set_description(obj, "cxl-fmw",
> > > +                                    "CXL Fixed Memory Window");  
> > 
> > Perhaps "CML fixed memory windows (array)" or something like that?
> > 
> > Paolo  
> 
> I had a mail which I apparently never sent. I'd like to see 'fmw' renamed, since
> that has no decoder ring in any spec that I'm aware of.
> 
> Why not keep cfmws nomenclature? It's well defined.

IIRC s is for structure and this isn't a structure, so I dropped the s.

Expanding cxl makes this a lot more meaningful outside of CXL related
specifications.  I preferred the full wording as is currently upstream
but the command lines are insanely long given the new form.

Jonathan


> 
> Ben


