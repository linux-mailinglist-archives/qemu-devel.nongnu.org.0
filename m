Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D0D00537CAF
	for <lists+qemu-devel@lfdr.de>; Mon, 30 May 2022 15:38:09 +0200 (CEST)
Received: from localhost ([::1]:42482 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nvfay-0005XZ-SU
	for lists+qemu-devel@lfdr.de; Mon, 30 May 2022 09:38:08 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:55780)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <arei.gonglei@huawei.com>)
 id 1nvfUq-0007S1-SE
 for qemu-devel@nongnu.org; Mon, 30 May 2022 09:31:49 -0400
Received: from szxga01-in.huawei.com ([45.249.212.187]:4511)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <arei.gonglei@huawei.com>)
 id 1nvfUd-00055P-U0
 for qemu-devel@nongnu.org; Mon, 30 May 2022 09:31:48 -0400
Received: from kwepemi500012.china.huawei.com (unknown [172.30.72.55])
 by szxga01-in.huawei.com (SkyGuard) with ESMTP id 4LBbqW3LhwzgYJS;
 Mon, 30 May 2022 21:29:43 +0800 (CST)
Received: from dggpemm500006.china.huawei.com (7.185.36.236) by
 kwepemi500012.china.huawei.com (7.221.188.12) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.24; Mon, 30 May 2022 21:31:20 +0800
Received: from dggpemm500006.china.huawei.com ([7.185.36.236]) by
 dggpemm500006.china.huawei.com ([7.185.36.236]) with mapi id 15.01.2375.024;
 Mon, 30 May 2022 21:31:20 +0800
To: zhenwei pi <pizhenwei@bytedance.com>, "mst@redhat.com" <mst@redhat.com>
CC: "qemu-devel@nongnu.org" <qemu-devel@nongnu.org>,
 "virtualization@lists.linux-foundation.org"
 <virtualization@lists.linux-foundation.org>, "helei.sig11@bytedance.com"
 <helei.sig11@bytedance.com>, "berrange@redhat.com" <berrange@redhat.com>
Subject: RE: [PATCH v8 1/1] crypto: Introduce RSA algorithm
Thread-Topic: [PATCH v8 1/1] crypto: Introduce RSA algorithm
Thread-Index: AQHYcab+Uy73hbBLQEKRln7LUOEy0K03azTg
Date: Mon, 30 May 2022 13:31:20 +0000
Message-ID: <848d579e2c504ba493cd57510a7ff3b0@huawei.com>
References: <20220527084734.2649594-1-pizhenwei@bytedance.com>
 <20220527084734.2649594-2-pizhenwei@bytedance.com>
In-Reply-To: <20220527084734.2649594-2-pizhenwei@bytedance.com>
Accept-Language: zh-CN, en-US
Content-Language: zh-CN
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [10.174.149.11]
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-CFilter-Loop: Reflected
Received-SPF: pass client-ip=45.249.212.187;
 envelope-from=arei.gonglei@huawei.com; helo=szxga01-in.huawei.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001, T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
Reply-to:  "Gonglei (Arei)" <arei.gonglei@huawei.com>
From:  "Gonglei (Arei)" via <qemu-devel@nongnu.org>



> -----Original Message-----
> From: zhenwei pi [mailto:pizhenwei@bytedance.com]
> Sent: Friday, May 27, 2022 4:48 PM
> To: mst@redhat.com; Gonglei (Arei) <arei.gonglei@huawei.com>
> Cc: qemu-devel@nongnu.org; virtualization@lists.linux-foundation.org;
> helei.sig11@bytedance.com; berrange@redhat.com; zhenwei pi
> <pizhenwei@bytedance.com>
> Subject: [PATCH v8 1/1] crypto: Introduce RSA algorithm
>=20
>=20
Skip...

> +static int64_t
> +virtio_crypto_create_asym_session(VirtIOCrypto *vcrypto,
> +               struct virtio_crypto_akcipher_create_session_req
> *sess_req,
> +               uint32_t queue_id, uint32_t opcode,
> +               struct iovec *iov, unsigned int out_num) {
> +    VirtIODevice *vdev =3D VIRTIO_DEVICE(vcrypto);
> +    CryptoDevBackendSessionInfo info =3D {0};
> +    CryptoDevBackendAsymSessionInfo *asym_info;
> +    int64_t session_id;
> +    int queue_index;
> +    uint32_t algo, keytype, keylen;
> +    g_autofree uint8_t *key =3D NULL;
> +    Error *local_err =3D NULL;
> +
> +    algo =3D ldl_le_p(&sess_req->para.algo);
> +    keytype =3D ldl_le_p(&sess_req->para.keytype);
> +    keylen =3D ldl_le_p(&sess_req->para.keylen);
> +
> +    if ((keytype !=3D VIRTIO_CRYPTO_AKCIPHER_KEY_TYPE_PUBLIC)
> +         && (keytype !=3D VIRTIO_CRYPTO_AKCIPHER_KEY_TYPE_PRIVATE)) {
> +        error_report("unsupported asym keytype: %d", keytype);
> +        return -VIRTIO_CRYPTO_NOTSUPP;
> +    }
> +
> +    if (keylen) {
> +        key =3D g_malloc(keylen);
> +        if (iov_to_buf(iov, out_num, 0, key, keylen) !=3D keylen) {
> +            virtio_error(vdev, "virtio-crypto asym key incorrect");
> +            return -EFAULT;

Memory leak.

> +        }
> +        iov_discard_front(&iov, &out_num, keylen);
> +    }
> +
> +    info.op_code =3D opcode;
> +    asym_info =3D &info.u.asym_sess_info;
> +    asym_info->algo =3D algo;
> +    asym_info->keytype =3D keytype;
> +    asym_info->keylen =3D keylen;
> +    asym_info->key =3D key;
> +    switch (asym_info->algo) {
> +    case VIRTIO_CRYPTO_AKCIPHER_RSA:
> +        asym_info->u.rsa.padding_algo =3D
> +            ldl_le_p(&sess_req->para.u.rsa.padding_algo);
> +        asym_info->u.rsa.hash_algo =3D
> +            ldl_le_p(&sess_req->para.u.rsa.hash_algo);
> +        break;
> +
> +    /* TODO DSA&ECDSA handling */
> +
> +    default:
> +        return -VIRTIO_CRYPTO_ERR;
> +    }
> +
> +    queue_index =3D virtio_crypto_vq2q(queue_id);
> +    session_id =3D cryptodev_backend_create_session(vcrypto->cryptodev,
> &info,
> +                     queue_index, &local_err);
> +    if (session_id < 0) {
> +        if (local_err) {
> +            error_report_err(local_err);
> +        }
> +        return -VIRTIO_CRYPTO_ERR;
> +    }
> +
> +    return session_id;

Where to free the key at both normal and exceptional paths?


Regards,
-Gonglei



