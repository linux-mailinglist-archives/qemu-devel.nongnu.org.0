Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 33BBC521B53
	for <lists+qemu-devel@lfdr.de>; Tue, 10 May 2022 16:07:37 +0200 (CEST)
Received: from localhost ([::1]:41524 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1noQWV-0002rl-SO
	for lists+qemu-devel@lfdr.de; Tue, 10 May 2022 10:07:35 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:46652)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <prvs=12211c048=anthony.perard@citrix.com>)
 id 1noQNW-0001c4-09
 for qemu-devel@nongnu.org; Tue, 10 May 2022 09:58:18 -0400
Received: from esa5.hc3370-68.iphmx.com ([216.71.155.168]:58942)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <prvs=12211c048=anthony.perard@citrix.com>)
 id 1noQNS-0001jl-VD
 for qemu-devel@nongnu.org; Tue, 10 May 2022 09:58:17 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1652191094;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=Kmx9wk4cMDDQPxc1uDfODGSdxjNm0ceeqq+ghc9uyG0=;
 b=MNZI2lZt9+PB6TvjvjxceV3wAWPsjmjTeNPy//lScOChoIrklGIQXgjq
 lzPK40Ktsiy5BfIpSJJOauKTeSobPfXCsSOh7FNVEdmAlwFNDZsemyEJf
 6X9HL45Hsn8IMe8qd6LtqYz6RGDiJulhTIsH8rbxilGnzS/Ewa7wk5TtR k=;
Authentication-Results: esa5.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none
X-SBRS: 5.1
X-MesageID: 70368361
X-Ironport-Server: esa5.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.83
X-Policy: $RELAYED
IronPort-Data: A9a23:nqLuNK94h63HfYUArpeQDrUDqH6TJUtcMsCJ2f8bNWPcYEJGY0x3z
 DFMCDzXPfqOZWrwKYpwa46w/UkH7cCBzdRmGVZprHw8E34SpcT7XtnIdU2Y0wF+jyHgoOCLy
 +1EN7Es+ehtFie0Si+Fa+Sn9T8mvU2xbuKU5NTsY0idfic5DnZ44f5fs7Rh2NQw3IHhW1nlV
 e7a+KUzBnf0g1aYDUpMg06zgEsHUCPa4W5wUvQWPJinjXeG/5UnJMt3yZKZdhMUdrJ8DO+iL
 9sv+Znilo/vE7XBPfv++lrzWhVirrc/pmFigFIOM0SpqkAqSiDfTs/XnRfTAKtao2zhojx/9
 DlCnbC2bSEyPqvBoe9DCB1BDSxuAKtm9qCSdBBTseTLp6HHW37lwvEoB0AqJ4wIvO1wBAmi9
 9RBdmpLNErawbvrnvTrEYGAhex6RCXvFIoZpnFnyyCfFfs8SIrPa67L+cVZzHE7gcUm8fP2O
 JJCN2o0Mk2ojxtnFGcGAdUEobeTtjrVcBt1rUOqoZVoyj2GpOB2+Oe0a4eEEjCQfu1YhEeT4
 Gvb8GnjKgsXONyW1XyO9XfErvTTkC3yXog6ELy+6+4snlue2ioSAhhQXly+ydG8g1S1UtRTM
 UFS/jc0oKEv3FamQtn0Q1uzp3vslgUAVtRZFecS7ACL17qS4gycQGMDS1ZpcdEjqYo6SCIn0
 nePmNXmAyEpt6eaIU9x7Z/N82n0Y3JMazZfO2lUFmPp/uUPvqkfiDbpVdZlHZe+0IbxAC/90
 w2MjCYh0uB7YdEw6423+lXOgjSJr5fPTxIo6gi/Yl9J/j+Vd6b+OdX2tAGzAeJoad/AEwLf5
 CRsd922trhmMH2bqMCarAzh9pmN7u3NDjDTiEUH83IJp2X0oC7LkWy9DVhDyKZV3iQsJGaBj
 Kz741o5CHpv0JyCN/YfXm5JI552pZUM7Py8PhwuUvJAY4JqaCiM9zx0aEib0gjFyRZxy/hlY
 MjLIZr0UB727JiLKxLsHI8gPUIDnHhilQs/u7ilp/hY7VZuTCHMEupUWLd/Rus48LmFsG3oH
 yV3bKO3J+FkeLSmOEH/qNdLRXhTdCRTLc2n8KR/K7/cSjeK7Ul8Upc9N5t6I9w790mU/8+Vl
 kyAtrhwkgSg3yGXclXaAp2hAZu2NatCQbsAFXREFT6VN7ILO+5DMI93m0MLQIQa
IronPort-HdrOrdr: A9a23:8wudLKDj2vVi7EblHems55DYdb4zR+YMi2TC1yhKJyC9Vvbo8/
 xG/c5rsCMc5wx9ZJhNo7y90ey7MBThHP1OkOss1NWZPDUO0VHAROoJ0WKh+UyCJ8SXzJ866U
 4KSclD4bPLYmRHsQ==
X-IronPort-AV: E=Sophos;i="5.91,214,1647316800"; d="scan'208";a="70368361"
Date: Tue, 10 May 2022 14:58:08 +0100
To: Stefan Berger <stefanb@linux.ibm.com>
CC: <qemu-devel@nongnu.org>, =?iso-8859-1?Q?Marc-Andr=E9?= Lureau
 <marcandre.lureau@redhat.com>, Eric Auger <eric.auger@redhat.com>, Stefan
 Berger <stefanb@linux.vnet.ibm.com>
Subject: Re: [PATCH] tpm_crb: mark command buffer as dirty on request
 completion
Message-ID: <YnpvcPDtfVZjcZhL@perard.uk.xensource.com>
References: <20220411144749.47185-1-anthony.perard@citrix.com>
 <1610a1ff-435e-e286-6bd7-a820630b865d@linux.ibm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <1610a1ff-435e-e286-6bd7-a820630b865d@linux.ibm.com>
Received-SPF: pass client-ip=216.71.155.168;
 envelope-from=prvs=12211c048=anthony.perard@citrix.com;
 helo=esa5.hc3370-68.iphmx.com
X-Spam_score_int: -44
X-Spam_score: -4.5
X-Spam_bar: ----
X-Spam_report: (-4.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_MED=-2.3, SPF_HELO_PASS=-0.001, SPF_PASS=-0.001,
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
Reply-to:  Anthony PERARD <anthony.perard@citrix.com>
From:  Anthony PERARD via <qemu-devel@nongnu.org>

On Mon, Apr 11, 2022 at 12:31:01PM -0400, Stefan Berger wrote:
> On 4/11/22 10:47, Anthony PERARD wrote:
> > From: Anthony PERARD <anthony.perard@citrix.com>
> The state of the registers is saved using this here:
> 
> static const VMStateDescription vmstate_tpm_crb = {
>     .name = "tpm-crb",
>     .pre_save = tpm_crb_pre_save,
>     .fields = (VMStateField[]) {
>         VMSTATE_UINT32_ARRAY(regs, CRBState, TPM_CRB_R_MAX),
>         VMSTATE_END_OF_LIST(),
>     }
> };
> 
> The buffer with the commands is not part of this. So likely it needs to be
> marked dirty but then I am not sure whether that is going to work if the
> response to a command on the CRB is only received when tpm_crb_pre_save() is
> called.. Maybe this buffer would have to be save explicitly in a .save
> function or also as part of vmstate_tpm_crb... ?

I did some research on migration of a guest with Xen toolstack, and I
think there is one last round of sending memory marked as dirty after we
call "xen-save-devices-state" (with the guest suspended), that's when
tpm_crb_pre_save() is called. Hopefully, when QEMU is in charge of
migration, it does the same thing and there would not be a need to save
the buffer in vmstate of this device.

Cheers,

-- 
Anthony PERARD

