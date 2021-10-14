Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3E3E442D897
	for <lists+qemu-devel@lfdr.de>; Thu, 14 Oct 2021 13:52:06 +0200 (CEST)
Received: from localhost ([::1]:44456 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mazHI-0003BH-Oj
	for lists+qemu-devel@lfdr.de; Thu, 14 Oct 2021 07:52:05 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:38972)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <gceq-qemu-devel2@m.gmane-mx.org>)
 id 1mazFP-0001ln-R2
 for qemu-devel@nongnu.org; Thu, 14 Oct 2021 07:50:09 -0400
Received: from ciao.gmane.io ([116.202.254.214]:35944)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <gceq-qemu-devel2@m.gmane-mx.org>)
 id 1mazFO-0006HP-Ba
 for qemu-devel@nongnu.org; Thu, 14 Oct 2021 07:50:07 -0400
Received: from list by ciao.gmane.io with local (Exim 4.92)
 (envelope-from <gceq-qemu-devel2@m.gmane-mx.org>) id 1mazFK-0003tX-99
 for qemu-devel@nongnu.org; Thu, 14 Oct 2021 13:50:02 +0200
X-Injected-Via-Gmane: http://gmane.org/
To: qemu-devel@nongnu.org
From: David Edmondson <dme@dme.org>
Subject: Re: [PATCH v2] docs/specs/tpm: Clarify command line parameters for
 network migration
Date: Thu, 14 Oct 2021 12:46:30 +0100
Message-ID: <cun35p3esmh.fsf@dme.org>
References: <20211014032700.3864022-1-stefanb@linux.ibm.com>
Mime-Version: 1.0
Content-Type: text/plain
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/29.0.50 (gnu/linux)
Cancel-Lock: sha1:Q5hQwpAjnH2qemh5LC8AA3uRyYk=
Received-SPF: pass client-ip=116.202.254.214;
 envelope-from=gceq-qemu-devel2@m.gmane-mx.org; helo=ciao.gmane.io
X-Spam_score_int: -16
X-Spam_score: -1.7
X-Spam_bar: -
X-Spam_report: (-1.7 / 5.0 requ) BAYES_00=-1.9,
 HEADER_FROM_DIFFERENT_DOMAINS=0.249, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Wednesday, 2021-10-13 at 23:27:00 -04, Stefan Berger wrote:

> Clarify the command line parameters for swtpm migration across the network
> for the case of shared storage and non-shared storage.
>
> Signed-off-by: Stefan Berger <stefanb@linux.ibm.com>
> ---
>  docs/specs/tpm.rst | 3 ++-
>  1 file changed, 2 insertions(+), 1 deletion(-)
>
> diff --git a/docs/specs/tpm.rst b/docs/specs/tpm.rst
> index 3be190343a..956f2c13dc 100644
> --- a/docs/specs/tpm.rst
> +++ b/docs/specs/tpm.rst
> @@ -482,7 +482,8 @@ VM migration across the network:
>   - QEMU command line parameters should be identical apart from the
>     '-incoming' option on the destination side
>  
> - - swtpm command line parameters should be identical
> + - swtpm command line parameters can be identical if storage is not
> +   shared and should be different for shared storage

I would interpret this as relating to the storage of the VM (virtual
disk devices), but you are referring to the storage used by swtpm,
presumably.

How about:

- typically, swtpm command line parameters should be different if the
  vTPM state directory is on shared storage, and should be the same if
  the vTPM state directory is not shared.

>  
>  VM Snapshotting:
>   - QEMU command line parameters should be identical


