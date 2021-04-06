Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 65BF8354D85
	for <lists+qemu-devel@lfdr.de>; Tue,  6 Apr 2021 09:13:12 +0200 (CEST)
Received: from localhost ([::1]:58332 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lTftf-0005oX-GW
	for lists+qemu-devel@lfdr.de; Tue, 06 Apr 2021 03:13:11 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:46038)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1lTfre-0004tF-JG
 for qemu-devel@nongnu.org; Tue, 06 Apr 2021 03:11:06 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:24184)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1lTfrZ-00076z-QQ
 for qemu-devel@nongnu.org; Tue, 06 Apr 2021 03:11:06 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1617693060;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=7yAg6rQ3WNN/62BVBkrld5qvOg8MDSH+sWvYsf7vNfw=;
 b=ZCqf0qzne2+l76QGKTHivuq5RCfWK2a/jbCdufroD1dM+2u/X+RwtKRIAg2I2DnoWgqmJ1
 Mbd9kCubZMiDpqOneKkI6NEtv/rm96Oi8oB4hV2/HNQytLVMfBLriwiXHoVKaFA0qO1vQ8
 nzbGcv3C5WOgq9X6Aq1nQVBGZwuhxiw=
Received: from mail-ed1-f69.google.com (mail-ed1-f69.google.com
 [209.85.208.69]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-1-fzTDBU53MUiZrcSefMzMBA-1; Tue, 06 Apr 2021 03:10:59 -0400
X-MC-Unique: fzTDBU53MUiZrcSefMzMBA-1
Received: by mail-ed1-f69.google.com with SMTP id t27so9911951edi.2
 for <qemu-devel@nongnu.org>; Tue, 06 Apr 2021 00:10:58 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=7yAg6rQ3WNN/62BVBkrld5qvOg8MDSH+sWvYsf7vNfw=;
 b=X5zqaY2Km3CeoDU54iK3o7qvyxSzByr7S2czN3rIsQQM7Ea0p56oYs5sESYYbnQ0zA
 YGrHlKGQusEBr9raPZiT+3fViFe/5mZkJH/QvLwUjDflCQ453doXyClfx+Ykw3nrDXQC
 aQkhQ8S+0vonGJbkwYPh1HJWG1KmYQDOEzj/iCjFsmvfso8ftmugXTu+C8oUsWxPiByN
 RNNRVQoEQ0AnxBsNSZYcsYOL8RZawi8mXuNgefik+DoMMoUpbv4bOsDHwr0DezEArRGE
 y8VDunq+H4+Nnl8/la3WqHs7apep/rnOGFi3A+YdknSdcwK6CkdbGcYM37tkCTSuCLbe
 sHCg==
X-Gm-Message-State: AOAM530KZtiZ6WF1sZdpuOSx/2rLSZbnT8K/HzVrRnWS+6S6UNq9cRBs
 yJJAxSXfvPjB7L6XHgLvvNayoUBoXb1ZVMjsTFoABdarDIhLxYuDAq2YHGGpBKcqhSUDMmpzobJ
 XNL74XcqYzlPOYp0=
X-Received: by 2002:aa7:d296:: with SMTP id w22mr37750494edq.150.1617693057886; 
 Tue, 06 Apr 2021 00:10:57 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJz+Llhi/9i4VCUMUoTleURmDe0+NGFoN5MdPpdRpFPhdbrSB0TojfnMsdOy+nj0fu+tgbhVhQ==
X-Received: by 2002:aa7:d296:: with SMTP id w22mr37750456edq.150.1617693057615; 
 Tue, 06 Apr 2021 00:10:57 -0700 (PDT)
Received: from [192.168.1.36] (17.red-88-21-201.staticip.rima-tde.net.
 [88.21.201.17])
 by smtp.gmail.com with ESMTPSA id cf4sm13083302edb.19.2021.04.06.00.10.56
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 06 Apr 2021 00:10:57 -0700 (PDT)
Subject: Re: [PATCH for-6.0 v2 6/8] hw/block/nvme: update dmsrl limit on
 namespace detachment
To: Klaus Jensen <its@irrelevant.dk>, qemu-devel@nongnu.org
References: <20210405175452.37578-1-its@irrelevant.dk>
 <20210405175452.37578-7-its@irrelevant.dk>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
Message-ID: <fa06244b-b4d9-9edb-0fef-495a477bbe71@redhat.com>
Date: Tue, 6 Apr 2021 09:10:55 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <20210405175452.37578-7-its@irrelevant.dk>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=philmd@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=philmd@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001,
 RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Cc: Kevin Wolf <kwolf@redhat.com>, Fam Zheng <fam@euphon.net>,
 Thomas Huth <thuth@redhat.com>, qemu-block@nongnu.org,
 Klaus Jensen <k.jensen@samsung.com>,
 Gollu Appalanaidu <anaidu.gollu@samsung.com>, Max Reitz <mreitz@redhat.com>,
 Stefan Hajnoczi <stefanha@redhat.com>, Keith Busch <kbusch@kernel.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 4/5/21 7:54 PM, Klaus Jensen wrote:
> From: Klaus Jensen <k.jensen@samsung.com>
> 
> The Non-MDTS DMSRL limit must be recomputed when namespaces are
> detached.
> 
> Fixes: 645ce1a70cb6 ("hw/block/nvme: support namespace attachment command")
> Signed-off-by: Klaus Jensen <k.jensen@samsung.com>
> Reviewed-by: Gollu Appalanaidu <anaidu.gollu@samsung.com>
> ---
>  hw/block/nvme.c | 17 +++++++++++++++++
>  1 file changed, 17 insertions(+)
> 
> diff --git a/hw/block/nvme.c b/hw/block/nvme.c
> index de0e726dfdd8..3dc51f407671 100644
> --- a/hw/block/nvme.c
> +++ b/hw/block/nvme.c
> @@ -4876,6 +4876,21 @@ static uint16_t nvme_aer(NvmeCtrl *n, NvmeRequest *req)
>      return NVME_NO_COMPLETE;
>  }
>  
> +static void __nvme_update_dmrsl(NvmeCtrl *n)
> +{
> +    int nsid;
> +
> +    for (nsid = 1; nsid <= NVME_MAX_NAMESPACES; nsid++) {
> +        NvmeNamespace *ns = nvme_ns(n, nsid);
> +        if (!ns) {
> +            continue;
> +        }
> +
> +        n->dmrsl = MIN_NON_ZERO(n->dmrsl,
> +                                BDRV_REQUEST_MAX_BYTES / nvme_l2b(ns, 1));
> +    }
> +}
> +
>  static void __nvme_select_ns_iocs(NvmeCtrl *n, NvmeNamespace *ns);
>  static uint16_t nvme_ns_attachment(NvmeCtrl *n, NvmeRequest *req)
>  {
> @@ -4925,6 +4940,8 @@ static uint16_t nvme_ns_attachment(NvmeCtrl *n, NvmeRequest *req)
>              }
>  
>              nvme_ns_detach(ctrl, ns);
> +
> +            __nvme_update_dmrsl(ctrl);
>          }

Why the '__' prefix? It doesn't seem clearer (I'm not sure there is
a convention, it makes me think of a internal macro expansion use
for preprocessor).

There are very few uses of this prefix:

hw/9pfs/cofs.c:21:static ssize_t __readlink(V9fsState *s, V9fsPath
*path, V9fsString *buf)
hw/block/nvme.c:1683:static uint16_t __nvme_zrm_open(NvmeNamespace *ns,
NvmeZone *zone,
hw/block/nvme.c:1742:static void __nvme_advance_zone_wp(NvmeNamespace
*ns, NvmeZone *zone,
hw/block/nvme.c:5213:static void __nvme_select_ns_iocs(NvmeCtrl *n,
NvmeNamespace *ns)
hw/i386/amd_iommu.c:1160:static int __amdvi_int_remap_msi(AMDVIState *iommu,
hw/intc/s390_flic_kvm.c:255:static int __get_all_irqs(KVMS390FLICState
*flic,
hw/net/rocker/rocker_desc.c:199:static bool
__desc_ring_post_desc(DescRing *ring, int err)
hw/net/sungem.c:766:static uint16_t __sungem_mii_read(SunGEMState *s,
uint8_t phy_addr,
hw/ppc/ppc.c:867:static void __cpu_ppc_store_decr(PowerPCCPU *cpu,
uint64_t *nextp,
hw/s390x/pv.c:25:static int __s390_pv_cmd(uint32_t cmd, const char
*cmdname, void *data)
pc-bios/s390-ccw/cio.c:315:static int __do_cio(SubChannelId schid,
uint32_t ccw_addr, int fmt, Irb *irb)
target/ppc/mmu-hash64.c:170:static void __helper_slbie(CPUPPCState *env,
target_ulong addr,

Thomas, Eric, is it worth cleaning these and updating the
'CODESTYLE.rst'?

Phil.


