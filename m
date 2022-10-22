Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id AA8C7609924
	for <lists+qemu-devel@lfdr.de>; Mon, 24 Oct 2022 06:27:27 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1omjmv-00088Q-5J
	for lists+qemu-devel@lfdr.de; Sun, 23 Oct 2022 18:49:49 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>)
 id 1omLwD-0008Qo-Nm; Sat, 22 Oct 2022 17:21:49 -0400
Received: from mout.kundenserver.de ([217.72.192.73])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>)
 id 1omLwC-0002Be-5C; Sat, 22 Oct 2022 17:21:49 -0400
Received: from [192.168.100.1] ([82.142.8.70]) by mrelayeu.kundenserver.de
 (mreue108 [213.165.67.119]) with ESMTPSA (Nemesis) id
 1MwQOx-1p3Bvm0Rkr-00sR0G; Sat, 22 Oct 2022 23:21:43 +0200
Message-ID: <9c4a9734-ce67-8538-40b2-227755bf9e0b@vivier.eu>
Date: Sat, 22 Oct 2022 23:21:42 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.2.1
Subject: Re: [PATCH] include/hw/scsi/scsi.h: Remove unused
 scsi_legacy_handle_cmdline() prototype
Content-Language: fr
To: Peter Maydell <peter.maydell@linaro.org>, qemu-devel@nongnu.org,
 qemu-trivial@nongnu.org
Cc: Thomas Huth <thuth@redhat.com>
References: <20221013130500.967432-1-peter.maydell@linaro.org>
From: Laurent Vivier <laurent@vivier.eu>
In-Reply-To: <20221013130500.967432-1-peter.maydell@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Provags-ID: V03:K1:ANN8iw0ocjPvmF4HfcM7fffJgduOLOa7hgk0w6oiWuEJwSzkUrn
 R4AF+XIhQ9kWD7zn9Zh/7bFEzdZ4zJ+jt7dE6U0kjBHcZjD0F3lfyUuc3JS+xSFljl8wBFM
 2pPoNl7XWW7Ob6EDYuVF2BgnK1yivwmzSSbjiIOm3mW+TFsKQcPEJyJCvKpMrtO4f2LRMtI
 FQIfo/MWontCSZEK7k3GA==
X-UI-Out-Filterresults: notjunk:1;V03:K0:0XIpKEmp6E4=:x09ZBlVX1QJ+U59I2KmKxg
 KJTFYNOUjjonqOcZYrdK/OxhI6IjZ48nJVKM0BJiiEFzFGJWYyRkRpSeGcVn2bdit3hpCiPxp
 dyOm9NfaYtywefh37atbOf+0IRfooWmeGBPJPMSWp4mLXOK8GQMDHjVC3aH4YoE2MHl/mQToc
 ro5pCL5vIVXUb1J9DLt9l6Smxk4cM5zRN+NDxS8kBY4Iea3vdsKSIDubknU+gp3ZlmZ1KKpBa
 DQB+2Zwx+2LXMG/oy/lKy0KqziOlvqQJJ2gsRakKHrbRqFhv8S0f882OG/9Xg80X3HI4OlxYW
 o5kYbJ2oWIOCOsNrDtwYykC0VzNSKP+uUGNuBe/o7D3ll3X4oGV51flfO9mnfVsBxj7BCSHCf
 WLL0SAwT1ej35l9oIITd/rNhL8Uz8KV1DQn+T+RbgAzwibmnYkaj1V7Ze0QlvTG+iwnwopFrn
 NFusgVGbjVnrQzhSNKETJ2BT/MseS/HxY4qLTD8CCgmpywKzGNoX8Yzl1zSMbR8E1iXgiSppR
 ervBsfbGIP/Lj2CT2Fo982uziBAEvVPfZDuK0K6PUJk+qp22Wtgf9qgasEMcF9XCeZSgGnJLF
 xyqBxKlllK6yH/gn4tAjOT/cRSmnAAOHEODBTXx+CQU9UgmKMo5gfRua9N1PG+y6eZcm7tNGu
 fjC+h33JwG9bwRuy8DZBJD8QtV0OV0XxsqJKnzUYphsbgIi7Z1GaJiikH74JrLFrrNF3lU/jY
 zS7Joct6Wvia3bA7fe47eFT5cYRil2oihu4V5tpPR3dVI3wVUd2sADY2iQngLcRsX7xl/q+hM
 iMCVhWy
Received-SPF: none client-ip=217.72.192.73; envelope-from=laurent@vivier.eu;
 helo=mout.kundenserver.de
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_NONE=0.001 autolearn=ham autolearn_force=no
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

Le 13/10/2022 à 15:05, Peter Maydell a écrit :
> In commit 1454509726719e0933c80 we removed the function
> scsi_legacy_handle_cmdline() and all of its callers, but forgot to
> delete the prototype from the header function.  Delete the prototype
> too.
> 
> Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
> ---
>   include/hw/scsi/scsi.h | 1 -
>   1 file changed, 1 deletion(-)
> 
> diff --git a/include/hw/scsi/scsi.h b/include/hw/scsi/scsi.h
> index 001103488c2..9ad86b25bb4 100644
> --- a/include/hw/scsi/scsi.h
> +++ b/include/hw/scsi/scsi.h
> @@ -187,7 +187,6 @@ SCSIDevice *scsi_bus_legacy_add_drive(SCSIBus *bus, BlockBackend *blk,
>                                         BlockdevOnError werror,
>                                         const char *serial, Error **errp);
>   void scsi_bus_legacy_handle_cmdline(SCSIBus *bus);
> -void scsi_legacy_handle_cmdline(void);
>   
>   SCSIRequest *scsi_req_alloc(const SCSIReqOps *reqops, SCSIDevice *d,
>                               uint32_t tag, uint32_t lun, void *hba_private);

Applied to my trivial-patches branch.

Thanks,
Laurent



