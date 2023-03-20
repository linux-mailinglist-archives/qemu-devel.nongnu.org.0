Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 577B56C0D4E
	for <lists+qemu-devel@lfdr.de>; Mon, 20 Mar 2023 10:30:20 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1peBp3-0004Ui-IM; Mon, 20 Mar 2023 05:28:57 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <quic_mliebel@quicinc.com>)
 id 1peBoq-0004U1-UW
 for qemu-devel@nongnu.org; Mon, 20 Mar 2023 05:28:46 -0400
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <quic_mliebel@quicinc.com>)
 id 1peBom-0000EB-GZ
 for qemu-devel@nongnu.org; Mon, 20 Mar 2023 05:28:44 -0400
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id
 32K8NhNp006833; Mon, 20 Mar 2023 09:28:38 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com;
 h=from : to : cc :
 subject : date : message-id : in-reply-to : references : mime-version :
 content-transfer-encoding : content-type; s=qcppdkim1;
 bh=PfmyxdWQwoOnoaGPkQPnMnhufQQqQa5N5fG7PcDLKu8=;
 b=bDZPuFmEkYDPAuW1yjgo2FJA1Xja4Jo4kcwBNpOwsqYGE+01vKQ5xKzgWUHS0JEY7dYI
 xr7sw6ija8X+GnpZlGO5BXu+kwdPIb6lK2mPjvRFj2zjA9Jz7sVE5A+Yo55QybRj1A/G
 UC9addPkV5LNW4wLESopWyF2UB8gPjwz4p/wUV5oIhLreBZn8bGjMFyv57a4gPCaBei6
 DgP4GiwMmfA2TL2KhKRONJz5wi9JnKCnjr7oaiqUDTlzOGpwKlR5zn6oc7tAcg8ZXWkr
 9cV7Bqg9drjS9BF6TL4bEzOZUBS1mgMj5r8AzzS0dAcdht4vw15WPL7gt9B93AlqjWDI 2g== 
Received: from nalasppmta05.qualcomm.com (Global_NAT1.qualcomm.com
 [129.46.96.20])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3pe25q9xmd-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 20 Mar 2023 09:28:37 +0000
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com
 [10.47.209.196])
 by NALASPPMTA05.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 32K9SaZ4030570
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 20 Mar 2023 09:28:36 GMT
Received: from hu-mliebel-lv.qualcomm.com (10.49.16.6) by
 nalasex01a.na.qualcomm.com (10.47.209.196) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.986.41; Mon, 20 Mar 2023 02:28:35 -0700
From: Marco Liebel <quic_mliebel@quicinc.com>
To: <qemu-devel@nongnu.org>
CC: Taylor Simpson <tsimpson@quicinc.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>, "Markus
 Armbruster" <armbru@redhat.com>,
 =?UTF-8?q?Daniel=20P=20=2E=20Berrang=C3=A9?= <berrange@redhat.com>,
 Marco Liebel <quic_mliebel@quicinc.com>
Subject: [PATCH v3 2/2] Use black code style for python scripts
Date: Mon, 20 Mar 2023 02:25:33 -0700
Message-ID: <20230320092533.2859433-3-quic_mliebel@quicinc.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20230320092533.2859433-1-quic_mliebel@quicinc.com>
References: <20230320092533.2859433-1-quic_mliebel@quicinc.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.49.16.6]
X-ClientProxiedBy: nalasex01a.na.qualcomm.com (10.47.209.196) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800
 signatures=585085
X-Proofpoint-GUID: XTG7u8xc_IXUPaVeOEMAFPfGoYLPEzz5
X-Proofpoint-ORIG-GUID: XTG7u8xc_IXUPaVeOEMAFPfGoYLPEzz5
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.254,Aquarius:18.0.942,Hydra:6.0.573,FMLib:17.11.170.22
 definitions=2023-03-20_06,2023-03-16_02,2023-02-09_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501
 adultscore=0 lowpriorityscore=0 phishscore=0 impostorscore=0
 malwarescore=0 suspectscore=0 clxscore=1015 bulkscore=0 mlxlogscore=999
 mlxscore=0 spamscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2303150002 definitions=main-2303200080
Received-SPF: pass client-ip=205.220.168.131;
 envelope-from=quic_mliebel@quicinc.com; helo=mx0a-0031df01.pphosted.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

Signed-off-by: Marco Liebel <quic_mliebel@quicinc.com>
---
 target/hexagon/dectree.py               | 396 ++++++++-------
 target/hexagon/gen_analyze_funcs.py     | 135 +++---
 target/hexagon/gen_helper_funcs.py      | 338 +++++++------
 target/hexagon/gen_helper_protos.py     | 165 ++++---
 target/hexagon/gen_idef_parser_funcs.py |  75 +--
 target/hexagon/gen_op_attribs.py        |  10 +-
 target/hexagon/gen_op_regs.py           |  77 +--
 target/hexagon/gen_opcodes_def.py       |   4 +-
 target/hexagon/gen_printinsn.py         |  80 +--
 target/hexagon/gen_shortcode.py         |  17 +-
 target/hexagon/gen_tcg_func_table.py    |  14 +-
 target/hexagon/gen_tcg_funcs.py         | 614 +++++++++++++-----------
 target/hexagon/hex_common.py            | 177 ++++---
 13 files changed, 1191 insertions(+), 911 deletions(-)

diff --git a/target/hexagon/dectree.py b/target/hexagon/dectree.py
index 29467ec7d7..f28e3b4d5b 100755
--- a/target/hexagon/dectree.py
+++ b/target/hexagon/dectree.py
@@ -23,94 +23,109 @@
 import sys
 import iset
 
-encs = {tag : ''.join(reversed(iset.iset[tag]['enc'].replace(' ', '')))
-    for tag in iset.tags if iset.iset[tag]['enc'] != 'MISSING ENCODING'}
-
-enc_classes = set([iset.iset[tag]['enc_class'] for tag in encs.keys()])
-subinsn_enc_classes = \
-    set([enc_class for enc_class in enc_classes \
-        if enc_class.startswith('SUBINSN_')])
-ext_enc_classes = \
-    set([enc_class for enc_class in enc_classes \
-        if enc_class not in ('NORMAL', '16BIT') and \
-           not enc_class.startswith('SUBINSN_')])
+encs = {
+    tag: "".join(reversed(iset.iset[tag]["enc"].replace(" ", "")))
+    for tag in iset.tags
+    if iset.iset[tag]["enc"] != "MISSING ENCODING"
+}
+
+enc_classes = set([iset.iset[tag]["enc_class"] for tag in encs.keys()])
+subinsn_enc_classes = set(
+    [enc_class for enc_class in enc_classes if enc_class.startswith("SUBINSN_")]
+)
+ext_enc_classes = set(
+    [
+        enc_class
+        for enc_class in enc_classes
+        if enc_class not in ("NORMAL", "16BIT") and not enc_class.startswith("SUBINSN_")
+    ]
+)
 
 try:
     subinsn_groupings = iset.subinsn_groupings
 except AttributeError:
     subinsn_groupings = {}
 
-for (tag, subinsn_grouping) in subinsn_groupings.items():
-    encs[tag] = ''.join(reversed(subinsn_grouping['enc'].replace(' ', '')))
+for tag, subinsn_grouping in subinsn_groupings.items():
+    encs[tag] = "".join(reversed(subinsn_grouping["enc"].replace(" ", "")))
 
-dectree_normal = {'leaves' : set()}
-dectree_16bit = {'leaves' : set()}
-dectree_subinsn_groupings = {'leaves' : set()}
-dectree_subinsns = {name : {'leaves' : set()} for name in subinsn_enc_classes}
-dectree_extensions = {name : {'leaves' : set()} for name in ext_enc_classes}
+dectree_normal = {"leaves": set()}
+dectree_16bit = {"leaves": set()}
+dectree_subinsn_groupings = {"leaves": set()}
+dectree_subinsns = {name: {"leaves": set()} for name in subinsn_enc_classes}
+dectree_extensions = {name: {"leaves": set()} for name in ext_enc_classes}
 
 for tag in encs.keys():
     if tag in subinsn_groupings:
-        dectree_subinsn_groupings['leaves'].add(tag)
+        dectree_subinsn_groupings["leaves"].add(tag)
         continue
-    enc_class = iset.iset[tag]['enc_class']
-    if enc_class.startswith('SUBINSN_'):
+    enc_class = iset.iset[tag]["enc_class"]
+    if enc_class.startswith("SUBINSN_"):
         if len(encs[tag]) != 32:
-            encs[tag] = encs[tag] + '0' * (32 - len(encs[tag]))
-        dectree_subinsns[enc_class]['leaves'].add(tag)
-    elif  enc_class == '16BIT':
+            encs[tag] = encs[tag] + "0" * (32 - len(encs[tag]))
+        dectree_subinsns[enc_class]["leaves"].add(tag)
+    elif enc_class == "16BIT":
         if len(encs[tag]) != 16:
-            raise Exception('Tag "{}" has enc_class "{}" and not an encoding ' +
-                            'width of 16 bits!'.format(tag, enc_class))
-        dectree_16bit['leaves'].add(tag)
+            raise Exception(
+                'Tag "{}" has enc_class "{}" and not an encoding '
+                + "width of 16 bits!".format(tag, enc_class)
+            )
+        dectree_16bit["leaves"].add(tag)
     else:
         if len(encs[tag]) != 32:
-            raise Exception('Tag "{}" has enc_class "{}" and not an encoding ' +
-                            'width of 32 bits!'.format(tag, enc_class))
-        if enc_class == 'NORMAL':
-            dectree_normal['leaves'].add(tag)
+            raise Exception(
+                'Tag "{}" has enc_class "{}" and not an encoding '
+                + "width of 32 bits!".format(tag, enc_class)
+            )
+        if enc_class == "NORMAL":
+            dectree_normal["leaves"].add(tag)
         else:
-            dectree_extensions[enc_class]['leaves'].add(tag)
+            dectree_extensions[enc_class]["leaves"].add(tag)
 
 faketags = set()
-for (tag, enc) in iset.enc_ext_spaces.items():
+for tag, enc in iset.enc_ext_spaces.items():
     faketags.add(tag)
-    encs[tag] = ''.join(reversed(enc.replace(' ', '')))
-    dectree_normal['leaves'].add(tag)
+    encs[tag] = "".join(reversed(enc.replace(" ", "")))
+    dectree_normal["leaves"].add(tag)
 
 faketags |= set(subinsn_groupings.keys())
 
+
 def every_bit_counts(bitset):
     for i in range(1, len(next(iter(bitset)))):
-        if len(set([bits[:i] + bits[i+1:] for bits in bitset])) == len(bitset):
+        if len(set([bits[:i] + bits[i + 1 :] for bits in bitset])) == len(bitset):
             return False
     return True
 
+
 def auto_separate(node):
-    tags = node['leaves']
+    tags = node["leaves"]
     if len(tags) <= 1:
         return
     enc_width = len(encs[next(iter(tags))])
-    opcode_bit_for_all = \
-        [all([encs[tag][i] in '01' \
-            for tag in tags]) for i in range(enc_width)]
-    opcode_bit_is_0_for_all = \
-        [opcode_bit_for_all[i] and all([encs[tag][i] == '0' \
-            for tag in tags]) for i in range(enc_width)]
-    opcode_bit_is_1_for_all = \
-        [opcode_bit_for_all[i] and all([encs[tag][i] == '1' \
-            for tag in tags]) for i in range(enc_width)]
-    differentiator_opcode_bit = \
-        [opcode_bit_for_all[i] and \
-         not (opcode_bit_is_0_for_all[i] or \
-         opcode_bit_is_1_for_all[i]) \
-            for i in range(enc_width)]
+    opcode_bit_for_all = [
+        all([encs[tag][i] in "01" for tag in tags]) for i in range(enc_width)
+    ]
+    opcode_bit_is_0_for_all = [
+        opcode_bit_for_all[i] and all([encs[tag][i] == "0" for tag in tags])
+        for i in range(enc_width)
+    ]
+    opcode_bit_is_1_for_all = [
+        opcode_bit_for_all[i] and all([encs[tag][i] == "1" for tag in tags])
+        for i in range(enc_width)
+    ]
+    differentiator_opcode_bit = [
+        opcode_bit_for_all[i]
+        and not (opcode_bit_is_0_for_all[i] or opcode_bit_is_1_for_all[i])
+        for i in range(enc_width)
+    ]
     best_width = 0
     for width in range(4, 0, -1):
         for lsb in range(enc_width - width, -1, -1):
-            bitset = set([encs[tag][lsb:lsb+width] for tag in tags])
-            if all(differentiator_opcode_bit[lsb:lsb+width]) and \
-                (len(bitset) == len(tags) or every_bit_counts(bitset)):
+            bitset = set([encs[tag][lsb : lsb + width] for tag in tags])
+            if all(differentiator_opcode_bit[lsb : lsb + width]) and (
+                len(bitset) == len(tags) or every_bit_counts(bitset)
+            ):
                 best_width = width
                 best_lsb = lsb
                 caught_all_tags = len(bitset) == len(tags)
@@ -118,33 +133,37 @@ def auto_separate(node):
         if best_width != 0:
             break
     if best_width == 0:
-        raise Exception('Could not find a way to differentiate the encodings ' +
-                         'of the following tags:\n{}'.format('\n'.join(tags)))
+        raise Exception(
+            "Could not find a way to differentiate the encodings "
+            + "of the following tags:\n{}".format("\n".join(tags))
+        )
     if caught_all_tags:
         for width in range(1, best_width):
             for lsb in range(enc_width - width, -1, -1):
-                bitset = set([encs[tag][lsb:lsb+width] for tag in tags])
-                if all(differentiator_opcode_bit[lsb:lsb+width]) and \
-                    len(bitset) == len(tags):
+                bitset = set([encs[tag][lsb : lsb + width] for tag in tags])
+                if all(differentiator_opcode_bit[lsb : lsb + width]) and len(
+                    bitset
+                ) == len(tags):
                     best_width = width
                     best_lsb = lsb
                     break
             else:
                 continue
             break
-    node['separator_lsb'] = best_lsb
-    node['separator_width'] = best_width
-    node['children'] = []
-    for value in range(2 ** best_width):
+    node["separator_lsb"] = best_lsb
+    node["separator_width"] = best_width
+    node["children"] = []
+    for value in range(2**best_width):
         child = {}
-        bits = ''.join(reversed('{:0{}b}'.format(value, best_width)))
-        child['leaves'] = \
-            set([tag for tag in tags \
-                if encs[tag][best_lsb:best_lsb+best_width] == bits])
-        node['children'].append(child)
-    for child in node['children']:
+        bits = "".join(reversed("{:0{}b}".format(value, best_width)))
+        child["leaves"] = set(
+            [tag for tag in tags if encs[tag][best_lsb : best_lsb + best_width] == bits]
+        )
+        node["children"].append(child)
+    for child in node["children"]:
         auto_separate(child)
 
+
 auto_separate(dectree_normal)
 auto_separate(dectree_16bit)
 if subinsn_groupings:
@@ -157,144 +176,173 @@ def auto_separate(node):
 for tag in faketags:
     del encs[tag]
 
+
 def table_name(parents, node):
     path = parents + [node]
     root = path[0]
-    tag = next(iter(node['leaves']))
+    tag = next(iter(node["leaves"]))
     if tag in subinsn_groupings:
-        enc_width = len(subinsn_groupings[tag]['enc'].replace(' ', ''))
+        enc_width = len(subinsn_groupings[tag]["enc"].replace(" ", ""))
     else:
-        tag = next(iter(node['leaves'] - faketags))
+        tag = next(iter(node["leaves"] - faketags))
         enc_width = len(encs[tag])
-    determining_bits = ['_'] * enc_width
-    for (parent, child) in zip(path[:-1], path[1:]):
-        lsb = parent['separator_lsb']
-        width = parent['separator_width']
-        value = parent['children'].index(child)
-        determining_bits[lsb:lsb+width] = \
-            list(reversed('{:0{}b}'.format(value, width)))
+    determining_bits = ["_"] * enc_width
+    for parent, child in zip(path[:-1], path[1:]):
+        lsb = parent["separator_lsb"]
+        width = parent["separator_width"]
+        value = parent["children"].index(child)
+        determining_bits[lsb : lsb + width] = list(
+            reversed("{:0{}b}".format(value, width))
+        )
     if tag in subinsn_groupings:
-        name = 'DECODE_ROOT_EE'
+        name = "DECODE_ROOT_EE"
     else:
-        enc_class = iset.iset[tag]['enc_class']
+        enc_class = iset.iset[tag]["enc_class"]
         if enc_class in ext_enc_classes:
-            name = 'DECODE_EXT_{}'.format(enc_class)
+            name = "DECODE_EXT_{}".format(enc_class)
         elif enc_class in subinsn_enc_classes:
-            name = 'DECODE_SUBINSN_{}'.format(enc_class)
+            name = "DECODE_SUBINSN_{}".format(enc_class)
         else:
-            name = 'DECODE_ROOT_{}'.format(enc_width)
+            name = "DECODE_ROOT_{}".format(enc_width)
     if node != root:
-        name += '_' + ''.join(reversed(determining_bits))
+        name += "_" + "".join(reversed(determining_bits))
     return name
 
+
 def print_node(f, node, parents):
-    if len(node['leaves']) <= 1:
+    if len(node["leaves"]) <= 1:
         return
     name = table_name(parents, node)
-    lsb = node['separator_lsb']
-    width = node['separator_width']
-    print('DECODE_NEW_TABLE({},{},DECODE_SEPARATOR_BITS({},{}))'.\
-        format(name, 2 ** width, lsb, width), file=f)
-    for child in node['children']:
-        if len(child['leaves']) == 0:
-            print('INVALID()', file=f)
-        elif len(child['leaves']) == 1:
-            (tag,) = child['leaves']
+    lsb = node["separator_lsb"]
+    width = node["separator_width"]
+    print(
+        "DECODE_NEW_TABLE({},{},DECODE_SEPARATOR_BITS({},{}))".format(
+            name, 2**width, lsb, width
+        ),
+        file=f,
+    )
+    for child in node["children"]:
+        if len(child["leaves"]) == 0:
+            print("INVALID()", file=f)
+        elif len(child["leaves"]) == 1:
+            (tag,) = child["leaves"]
             if tag in subinsn_groupings:
-                class_a = subinsn_groupings[tag]['class_a']
-                class_b = subinsn_groupings[tag]['class_b']
-                enc = subinsn_groupings[tag]['enc'].replace(' ', '')
-                if 'RESERVED' in tag:
-                    print('INVALID()', file=f)
+                class_a = subinsn_groupings[tag]["class_a"]
+                class_b = subinsn_groupings[tag]["class_b"]
+                enc = subinsn_groupings[tag]["enc"].replace(" ", "")
+                if "RESERVED" in tag:
+                    print("INVALID()", file=f)
                 else:
-                    print('SUBINSNS({},{},{},"{}")'.\
-                        format(tag, class_a, class_b, enc), file=f)
+                    print(
+                        'SUBINSNS({},{},{},"{}")'.format(tag, class_a, class_b, enc),
+                        file=f,
+                    )
             elif tag in iset.enc_ext_spaces:
-                enc = iset.enc_ext_spaces[tag].replace(' ', '')
+                enc = iset.enc_ext_spaces[tag].replace(" ", "")
                 print('EXTSPACE({},"{}")'.format(tag, enc), file=f)
             else:
-                enc = ''.join(reversed(encs[tag]))
+                enc = "".join(reversed(encs[tag]))
                 print('TERMINAL({},"{}")'.format(tag, enc), file=f)
         else:
-            print('TABLE_LINK({})'.format(table_name(parents + [node], child)),
-                  file=f)
-    print('DECODE_END_TABLE({},{},DECODE_SEPARATOR_BITS({},{}))'.\
-        format(name, 2 ** width, lsb, width), file=f)
+            print("TABLE_LINK({})".format(table_name(parents + [node], child)), file=f)
+    print(
+        "DECODE_END_TABLE({},{},DECODE_SEPARATOR_BITS({},{}))".format(
+            name, 2**width, lsb, width
+        ),
+        file=f,
+    )
     print(file=f)
     parents.append(node)
-    for child in node['children']:
+    for child in node["children"]:
         print_node(f, child, parents)
     parents.pop()
 
+
 def print_tree(f, tree):
     print_node(f, tree, [])
 
+
 def print_match_info(f):
     for tag in sorted(encs.keys(), key=iset.tags.index):
-        enc = ''.join(reversed(encs[tag]))
-        mask = int(re.sub(r'[^1]', r'0', enc.replace('0', '1')), 2)
-        match = int(re.sub(r'[^01]', r'0', enc), 2)
-        suffix = ''
-        print('DECODE{}_MATCH_INFO({},0x{:x}U,0x{:x}U)'.\
-            format(suffix, tag, mask, match), file=f)
+        enc = "".join(reversed(encs[tag]))
+        mask = int(re.sub(r"[^1]", r"0", enc.replace("0", "1")), 2)
+        match = int(re.sub(r"[^01]", r"0", enc), 2)
+        suffix = ""
+        print(
+            "DECODE{}_MATCH_INFO({},0x{:x}U,0x{:x}U)".format(suffix, tag, mask, match),
+            file=f,
+        )
+
+
+regre = re.compile(r"((?<!DUP)[MNORCPQXSGVZA])([stuvwxyzdefg]+)([.]?[LlHh]?)(\d+S?)")
+immre = re.compile(r"[#]([rRsSuUm])(\d+)(?:[:](\d+))?")
 
-regre = re.compile(
-    r'((?<!DUP)[MNORCPQXSGVZA])([stuvwxyzdefg]+)([.]?[LlHh]?)(\d+S?)')
-immre = re.compile(r'[#]([rRsSuUm])(\d+)(?:[:](\d+))?')
 
 def ordered_unique(l):
     return sorted(set(l), key=l.index)
 
-implicit_registers = {
-    'SP' : 29,
-    'FP' : 30,
-    'LR' : 31
-}
 
-num_registers = {
-    'R' : 32,
-    'V' : 32
-}
+implicit_registers = {"SP": 29, "FP": 30, "LR": 31}
+
+num_registers = {"R": 32, "V": 32}
+
 
 def print_op_info(f):
     for tag in sorted(encs.keys(), key=iset.tags.index):
         enc = encs[tag]
         print(file=f)
-        print('DECODE_OPINFO({},'.format(tag), file=f)
-        regs = ordered_unique(regre.findall(iset.iset[tag]['syntax']))
-        imms = ordered_unique(immre.findall(iset.iset[tag]['syntax']))
+        print("DECODE_OPINFO({},".format(tag), file=f)
+        regs = ordered_unique(regre.findall(iset.iset[tag]["syntax"]))
+        imms = ordered_unique(immre.findall(iset.iset[tag]["syntax"]))
         regno = 0
         for reg in regs:
             reg_type = reg[0]
             reg_letter = reg[1][0]
-            reg_num_choices = int(reg[3].rstrip('S'))
-            reg_mapping = reg[0] + ''.join(['_' for letter in reg[1]]) + reg[3]
-            reg_enc_fields = re.findall(reg_letter + '+', enc)
+            reg_num_choices = int(reg[3].rstrip("S"))
+            reg_mapping = reg[0] + "".join(["_" for letter in reg[1]]) + reg[3]
+            reg_enc_fields = re.findall(reg_letter + "+", enc)
             if len(reg_enc_fields) == 0:
                 raise Exception('Tag "{}" missing register field!'.format(tag))
             if len(reg_enc_fields) > 1:
-                raise Exception('Tag "{}" has split register field!'.\
-                    format(tag))
+                raise Exception('Tag "{}" has split register field!'.format(tag))
             reg_enc_field = reg_enc_fields[0]
             if 2 ** len(reg_enc_field) != reg_num_choices:
-                raise Exception('Tag "{}" has incorrect register field width!'.\
-                    format(tag))
-            print('        DECODE_REG({},{},{})'.\
-                format(regno, len(reg_enc_field), enc.index(reg_enc_field)),
-                       file=f)
-            if reg_type in num_registers and \
-                reg_num_choices != num_registers[reg_type]:
-                print('        DECODE_MAPPED_REG({},{})'.\
-                    format(regno, reg_mapping), file=f)
+                raise Exception(
+                    'Tag "{}" has incorrect register field width!'.format(tag)
+                )
+            print(
+                "        DECODE_REG({},{},{})".format(
+                    regno, len(reg_enc_field), enc.index(reg_enc_field)
+                ),
+                file=f,
+            )
+            if reg_type in num_registers and reg_num_choices != num_registers[reg_type]:
+                print(
+                    "        DECODE_MAPPED_REG({},{})".format(regno, reg_mapping),
+                    file=f,
+                )
             regno += 1
+
         def implicit_register_key(reg):
             return implicit_registers[reg]
+
         for reg in sorted(
-            set([r for r in (iset.iset[tag]['rregs'].split(',') + \
-                iset.iset[tag]['wregs'].split(',')) \
-                    if r in implicit_registers]), key=implicit_register_key):
-            print('        DECODE_IMPL_REG({},{})'.\
-                format(regno, implicit_registers[reg]), file=f)
+            set(
+                [
+                    r
+                    for r in (
+                        iset.iset[tag]["rregs"].split(",")
+                        + iset.iset[tag]["wregs"].split(",")
+                    )
+                    if r in implicit_registers
+                ]
+            ),
+            key=implicit_register_key,
+        ):
+            print(
+                "        DECODE_IMPL_REG({},{})".format(regno, implicit_registers[reg]),
+                file=f,
+            )
             regno += 1
         if imms and imms[0][0].isupper():
             imms = reversed(imms)
@@ -311,41 +359,45 @@ def implicit_register_key(reg):
             else:
                 imm_shift = 0
             if imm_type.islower():
-                imm_letter = 'i'
+                imm_letter = "i"
             else:
-                imm_letter = 'I'
+                imm_letter = "I"
             remainder = imm_width
-            for m in reversed(list(re.finditer(imm_letter + '+', enc))):
+            for m in reversed(list(re.finditer(imm_letter + "+", enc))):
                 remainder -= m.end() - m.start()
-                print('        DECODE_IMM({},{},{},{})'.\
-                    format(immno, m.end() - m.start(), m.start(), remainder),
-                        file=f)
+                print(
+                    "        DECODE_IMM({},{},{},{})".format(
+                        immno, m.end() - m.start(), m.start(), remainder
+                    ),
+                    file=f,
+                )
             if remainder != 0:
                 if imm[2]:
-                    imm[2] = ':' + imm[2]
-                raise Exception('Tag "{}" has an incorrect number of ' + \
-                    'encoding bits for immediate "{}"'.\
-                    format(tag, ''.join(imm)))
-            if imm_type.lower() in 'sr':
-                print('        DECODE_IMM_SXT({},{})'.\
-                    format(immno, imm_width), file=f)
-            if imm_type.lower() == 'n':
-                print('        DECODE_IMM_NEG({},{})'.\
-                    format(immno, imm_width), file=f)
+                    imm[2] = ":" + imm[2]
+                raise Exception(
+                    'Tag "{}" has an incorrect number of '
+                    + 'encoding bits for immediate "{}"'.format(tag, "".join(imm))
+                )
+            if imm_type.lower() in "sr":
+                print("        DECODE_IMM_SXT({},{})".format(immno, imm_width), file=f)
+            if imm_type.lower() == "n":
+                print("        DECODE_IMM_NEG({},{})".format(immno, imm_width), file=f)
             if imm_shift:
-                print('        DECODE_IMM_SHIFT({},{})'.\
-                    format(immno, imm_shift), file=f)
-        print(')', file=f)
+                print(
+                    "        DECODE_IMM_SHIFT({},{})".format(immno, imm_shift), file=f
+                )
+        print(")", file=f)
+
 
-if __name__ == '__main__':
-    with open(sys.argv[1], 'w') as f:
+if __name__ == "__main__":
+    with open(sys.argv[1], "w") as f:
         print_tree(f, dectree_normal)
         print_tree(f, dectree_16bit)
         if subinsn_groupings:
             print_tree(f, dectree_subinsn_groupings)
-        for (name, dectree_subinsn) in sorted(dectree_subinsns.items()):
+        for name, dectree_subinsn in sorted(dectree_subinsns.items()):
             print_tree(f, dectree_subinsn)
-        for (name, dectree_ext) in sorted(dectree_extensions.items()):
+        for name, dectree_ext in sorted(dectree_extensions.items()):
             print_tree(f, dectree_ext)
         print_match_info(f)
         print_op_info(f)
diff --git a/target/hexagon/gen_analyze_funcs.py b/target/hexagon/gen_analyze_funcs.py
index 1e246209e8..c74443da78 100755
--- a/target/hexagon/gen_analyze_funcs.py
+++ b/target/hexagon/gen_analyze_funcs.py
@@ -22,137 +22,141 @@
 import string
 import hex_common
 
+
 ##
 ## Helpers for gen_analyze_func
 ##
 def is_predicated(tag):
-    return 'A_CONDEXEC' in hex_common.attribdict[tag]
+    return "A_CONDEXEC" in hex_common.attribdict[tag]
+
 
 def analyze_opn_old(f, tag, regtype, regid, regno):
     regN = f"{regtype}{regid}N"
     predicated = "true" if is_predicated(tag) else "false"
-    if (regtype == "R"):
-        if (regid in {"ss", "tt"}):
+    if regtype == "R":
+        if regid in {"ss", "tt"}:
             f.write(f"//    const int {regN} = insn->regno[{regno}];\n")
-        elif (regid in {"dd", "ee", "xx", "yy"}):
+        elif regid in {"dd", "ee", "xx", "yy"}:
             f.write(f"    const int {regN} = insn->regno[{regno}];\n")
             f.write(f"    ctx_log_reg_write_pair(ctx, {regN}, {predicated});\n")
-        elif (regid in {"s", "t", "u", "v"}):
+        elif regid in {"s", "t", "u", "v"}:
             f.write(f"//    const int {regN} = insn->regno[{regno}];\n")
-        elif (regid in {"d", "e", "x", "y"}):
+        elif regid in {"d", "e", "x", "y"}:
             f.write(f"    const int {regN} = insn->regno[{regno}];\n")
             f.write(f"    ctx_log_reg_write(ctx, {regN}, {predicated});\n")
         else:
             print("Bad register parse: ", regtype, regid)
-    elif (regtype == "P"):
-        if (regid in {"s", "t", "u", "v"}):
+    elif regtype == "P":
+        if regid in {"s", "t", "u", "v"}:
             f.write(f"//    const int {regN} = insn->regno[{regno}];\n")
-        elif (regid in {"d", "e", "x"}):
+        elif regid in {"d", "e", "x"}:
             f.write(f"    const int {regN} = insn->regno[{regno}];\n")
             f.write(f"    ctx_log_pred_write(ctx, {regN});\n")
         else:
             print("Bad register parse: ", regtype, regid)
-    elif (regtype == "C"):
-        if (regid == "ss"):
-            f.write(f"//    const int {regN} = insn->regno[{regno}] "
-                     "+ HEX_REG_SA0;\n")
-        elif (regid == "dd"):
-            f.write(f"    const int {regN} = insn->regno[{regno}] "
-                     "+ HEX_REG_SA0;\n")
+    elif regtype == "C":
+        if regid == "ss":
+            f.write(
+                f"//    const int {regN} = insn->regno[{regno}] " "+ HEX_REG_SA0;\n"
+            )
+        elif regid == "dd":
+            f.write(f"    const int {regN} = insn->regno[{regno}] " "+ HEX_REG_SA0;\n")
             f.write(f"    ctx_log_reg_write_pair(ctx, {regN}, {predicated});\n")
-        elif (regid == "s"):
-            f.write(f"//    const int {regN} = insn->regno[{regno}] "
-                     "+ HEX_REG_SA0;\n")
-        elif (regid == "d"):
-            f.write(f"    const int {regN} = insn->regno[{regno}] "
-                     "+ HEX_REG_SA0;\n")
+        elif regid == "s":
+            f.write(
+                f"//    const int {regN} = insn->regno[{regno}] " "+ HEX_REG_SA0;\n"
+            )
+        elif regid == "d":
+            f.write(f"    const int {regN} = insn->regno[{regno}] " "+ HEX_REG_SA0;\n")
             f.write(f"    ctx_log_reg_write(ctx, {regN}, {predicated});\n")
         else:
             print("Bad register parse: ", regtype, regid)
-    elif (regtype == "M"):
-        if (regid == "u"):
+    elif regtype == "M":
+        if regid == "u":
             f.write(f"//    const int {regN} = insn->regno[{regno}];\n")
         else:
             print("Bad register parse: ", regtype, regid)
-    elif (regtype == "V"):
+    elif regtype == "V":
         newv = "EXT_DFL"
-        if (hex_common.is_new_result(tag)):
+        if hex_common.is_new_result(tag):
             newv = "EXT_NEW"
-        elif (hex_common.is_tmp_result(tag)):
+        elif hex_common.is_tmp_result(tag):
             newv = "EXT_TMP"
-        if (regid in {"dd", "xx"}):
+        if regid in {"dd", "xx"}:
             f.write(f"    const int {regN} = insn->regno[{regno}];\n")
-            f.write(f"    ctx_log_vreg_write_pair(ctx, {regN}, {newv}, "
-                    f"{predicated});\n")
-        elif (regid in {"uu", "vv"}):
+            f.write(
+                f"    ctx_log_vreg_write_pair(ctx, {regN}, {newv}, " f"{predicated});\n"
+            )
+        elif regid in {"uu", "vv"}:
             f.write(f"//    const int {regN} = insn->regno[{regno}];\n")
-        elif (regid in {"s", "u", "v", "w"}):
+        elif regid in {"s", "u", "v", "w"}:
             f.write(f"//    const int {regN} = insn->regno[{regno}];\n")
-        elif (regid in {"d", "x", "y"}):
+        elif regid in {"d", "x", "y"}:
             f.write(f"    const int {regN} = insn->regno[{regno}];\n")
-            f.write(f"    ctx_log_vreg_write(ctx, {regN}, {newv}, "
-                    f"{predicated});\n")
+            f.write(f"    ctx_log_vreg_write(ctx, {regN}, {newv}, " f"{predicated});\n")
         else:
             print("Bad register parse: ", regtype, regid)
-    elif (regtype == "Q"):
-        if (regid in {"d", "e", "x"}):
+    elif regtype == "Q":
+        if regid in {"d", "e", "x"}:
             f.write(f"    const int {regN} = insn->regno[{regno}];\n")
             f.write(f"    ctx_log_qreg_write(ctx, {regN});\n")
-        elif (regid in {"s", "t", "u", "v"}):
+        elif regid in {"s", "t", "u", "v"}:
             f.write(f"//    const int {regN} = insn->regno[{regno}];\n")
         else:
             print("Bad register parse: ", regtype, regid)
-    elif (regtype == "G"):
-        if (regid in {"dd"}):
+    elif regtype == "G":
+        if regid in {"dd"}:
             f.write(f"//    const int {regN} = insn->regno[{regno}];\n")
-        elif (regid in {"d"}):
+        elif regid in {"d"}:
             f.write(f"//    const int {regN} = insn->regno[{regno}];\n")
-        elif (regid in {"ss"}):
+        elif regid in {"ss"}:
             f.write(f"//    const int {regN} = insn->regno[{regno}];\n")
-        elif (regid in {"s"}):
+        elif regid in {"s"}:
             f.write(f"//    const int {regN} = insn->regno[{regno}];\n")
         else:
             print("Bad register parse: ", regtype, regid)
-    elif (regtype == "S"):
-        if (regid in {"dd"}):
+    elif regtype == "S":
+        if regid in {"dd"}:
             f.write(f"//    const int {regN} = insn->regno[{regno}];\n")
-        elif (regid in {"d"}):
+        elif regid in {"d"}:
             f.write(f"//    const int {regN} = insn->regno[{regno}];\n")
-        elif (regid in {"ss"}):
+        elif regid in {"ss"}:
             f.write(f"//    const int {regN} = insn->regno[{regno}];\n")
-        elif (regid in {"s"}):
+        elif regid in {"s"}:
             f.write(f"//    const int {regN} = insn->regno[{regno}];\n")
         else:
             print("Bad register parse: ", regtype, regid)
     else:
         print("Bad register parse: ", regtype, regid)
 
+
 def analyze_opn_new(f, tag, regtype, regid, regno):
     regN = f"{regtype}{regid}N"
-    if (regtype == "N"):
-        if (regid in {"s", "t"}):
+    if regtype == "N":
+        if regid in {"s", "t"}:
             f.write(f"//    const int {regN} = insn->regno[{regno}];\n")
         else:
             print("Bad register parse: ", regtype, regid)
-    elif (regtype == "P"):
-        if (regid in {"t", "u", "v"}):
+    elif regtype == "P":
+        if regid in {"t", "u", "v"}:
             f.write(f"//    const int {regN} = insn->regno[{regno}];\n")
         else:
             print("Bad register parse: ", regtype, regid)
-    elif (regtype == "O"):
-        if (regid == "s"):
+    elif regtype == "O":
+        if regid == "s":
             f.write(f"//    const int {regN} = insn->regno[{regno}];\n")
         else:
             print("Bad register parse: ", regtype, regid)
     else:
         print("Bad register parse: ", regtype, regid)
 
+
 def analyze_opn(f, tag, regtype, regid, toss, numregs, i):
-    if (hex_common.is_pair(regid)):
+    if hex_common.is_pair(regid):
         analyze_opn_old(f, tag, regtype, regid, i)
-    elif (hex_common.is_single(regid)):
+    elif hex_common.is_single(regid):
         if hex_common.is_old_val(regtype, regid, tag):
-            analyze_opn_old(f,tag, regtype, regid, i)
+            analyze_opn_old(f, tag, regtype, regid, i)
         elif hex_common.is_new_val(regtype, regid, tag):
             analyze_opn_new(f, tag, regtype, regid, i)
         else:
@@ -160,6 +164,7 @@ def analyze_opn(f, tag, regtype, regid, toss, numregs, i):
     else:
         print("Bad register parse: ", regtype, regid, toss, numregs)
 
+
 ##
 ## Generate the code to analyze the instruction
 ##     For A2_add: Rd32=add(Rs32,Rt32), { RdV=RsV+RtV;}
@@ -175,24 +180,25 @@ def analyze_opn(f, tag, regtype, regid, toss, numregs, i):
 ##
 def gen_analyze_func(f, tag, regs, imms):
     f.write(f"static void analyze_{tag}(DisasContext *ctx)\n")
-    f.write('{\n')
+    f.write("{\n")
 
     f.write("    Insn *insn G_GNUC_UNUSED = ctx->insn;\n")
 
-    i=0
+    i = 0
     ## Analyze all the registers
     for regtype, regid, toss, numregs in regs:
         analyze_opn(f, tag, regtype, regid, toss, numregs, i)
         i += 1
 
-    has_generated_helper = (not hex_common.skip_qemu_helper(tag) and
-                            not hex_common.is_idef_parser_enabled(tag))
-    if (has_generated_helper and
-        'A_SCALAR_LOAD' in hex_common.attribdict[tag]):
+    has_generated_helper = not hex_common.skip_qemu_helper(
+        tag
+    ) and not hex_common.is_idef_parser_enabled(tag)
+    if has_generated_helper and "A_SCALAR_LOAD" in hex_common.attribdict[tag]:
         f.write("    ctx->need_pkt_has_store_s1 = true;\n")
 
     f.write("}\n\n")
 
+
 def main():
     hex_common.read_semantics_file(sys.argv[1])
     hex_common.read_attribs_file(sys.argv[2])
@@ -214,7 +220,7 @@ def main():
     tagregs = hex_common.get_tagregs()
     tagimms = hex_common.get_tagimms()
 
-    with open(sys.argv[-1], 'w') as f:
+    with open(sys.argv[-1], "w") as f:
         f.write("#ifndef HEXAGON_TCG_FUNCS_H\n")
         f.write("#define HEXAGON_TCG_FUNCS_H\n\n")
 
@@ -223,5 +229,6 @@ def main():
 
         f.write("#endif    /* HEXAGON_TCG_FUNCS_H */\n")
 
+
 if __name__ == "__main__":
     main()
diff --git a/target/hexagon/gen_helper_funcs.py b/target/hexagon/gen_helper_funcs.py
index dc67eaf716..c4e04508f8 100755
--- a/target/hexagon/gen_helper_funcs.py
+++ b/target/hexagon/gen_helper_funcs.py
@@ -22,131 +22,171 @@
 import string
 import hex_common
 
+
 ##
 ## Helpers for gen_helper_function
 ##
 def gen_decl_ea(f):
     f.write("    uint32_t EA;\n")
 
-def gen_helper_return_type(f,regtype,regid,regno):
-    if regno > 1 : f.write(", ")
+
+def gen_helper_return_type(f, regtype, regid, regno):
+    if regno > 1:
+        f.write(", ")
     f.write("int32_t")
 
-def gen_helper_return_type_pair(f,regtype,regid,regno):
-    if regno > 1 : f.write(", ")
+
+def gen_helper_return_type_pair(f, regtype, regid, regno):
+    if regno > 1:
+        f.write(", ")
     f.write("int64_t")
 
-def gen_helper_arg(f,regtype,regid,regno):
-    if regno > 0 : f.write(", " )
+
+def gen_helper_arg(f, regtype, regid, regno):
+    if regno > 0:
+        f.write(", ")
     f.write(f"int32_t {regtype}{regid}V")
 
-def gen_helper_arg_new(f,regtype,regid,regno):
-    if regno >= 0 : f.write(", " )
+
+def gen_helper_arg_new(f, regtype, regid, regno):
+    if regno >= 0:
+        f.write(", ")
     f.write(f"int32_t {regtype}{regid}N")
 
-def gen_helper_arg_pair(f,regtype,regid,regno):
-    if regno >= 0 : f.write(", ")
+
+def gen_helper_arg_pair(f, regtype, regid, regno):
+    if regno >= 0:
+        f.write(", ")
     f.write(f"int64_t {regtype}{regid}V")
 
-def gen_helper_arg_ext(f,regtype,regid,regno):
-    if regno > 0 : f.write(", ")
+
+def gen_helper_arg_ext(f, regtype, regid, regno):
+    if regno > 0:
+        f.write(", ")
     f.write(f"void *{regtype}{regid}V_void")
 
-def gen_helper_arg_ext_pair(f,regtype,regid,regno):
-    if regno > 0 : f.write(", ")
+
+def gen_helper_arg_ext_pair(f, regtype, regid, regno):
+    if regno > 0:
+        f.write(", ")
     f.write(f"void *{regtype}{regid}V_void")
 
-def gen_helper_arg_opn(f,regtype,regid,i,tag):
-    if (hex_common.is_pair(regid)):
-        if (hex_common.is_hvx_reg(regtype)):
-            gen_helper_arg_ext_pair(f,regtype,regid,i)
+
+def gen_helper_arg_opn(f, regtype, regid, i, tag):
+    if hex_common.is_pair(regid):
+        if hex_common.is_hvx_reg(regtype):
+            gen_helper_arg_ext_pair(f, regtype, regid, i)
         else:
-            gen_helper_arg_pair(f,regtype,regid,i)
-    elif (hex_common.is_single(regid)):
+            gen_helper_arg_pair(f, regtype, regid, i)
+    elif hex_common.is_single(regid):
         if hex_common.is_old_val(regtype, regid, tag):
-            if (hex_common.is_hvx_reg(regtype)):
-                gen_helper_arg_ext(f,regtype,regid,i)
+            if hex_common.is_hvx_reg(regtype):
+                gen_helper_arg_ext(f, regtype, regid, i)
             else:
-                gen_helper_arg(f,regtype,regid,i)
+                gen_helper_arg(f, regtype, regid, i)
         elif hex_common.is_new_val(regtype, regid, tag):
-            gen_helper_arg_new(f,regtype,regid,i)
+            gen_helper_arg_new(f, regtype, regid, i)
         else:
-            print("Bad register parse: ",regtype,regid,toss,numregs)
+            print("Bad register parse: ", regtype, regid, toss, numregs)
     else:
-        print("Bad register parse: ",regtype,regid,toss,numregs)
+        print("Bad register parse: ", regtype, regid, toss, numregs)
 
-def gen_helper_arg_imm(f,immlett):
+
+def gen_helper_arg_imm(f, immlett):
     f.write(f", int32_t {hex_common.imm_name(immlett)}")
 
-def gen_helper_dest_decl(f,regtype,regid,regno,subfield=""):
+
+def gen_helper_dest_decl(f, regtype, regid, regno, subfield=""):
     f.write(f"    int32_t {regtype}{regid}V{subfield} = 0;\n")
 
-def gen_helper_dest_decl_pair(f,regtype,regid,regno,subfield=""):
+
+def gen_helper_dest_decl_pair(f, regtype, regid, regno, subfield=""):
     f.write(f"    int64_t {regtype}{regid}V{subfield} = 0;\n")
 
-def gen_helper_dest_decl_ext(f,regtype,regid):
-    if (regtype == "Q"):
-        f.write(f"    /* {regtype}{regid}V is *(MMQReg *)"
-                f"({regtype}{regid}V_void) */\n")
+
+def gen_helper_dest_decl_ext(f, regtype, regid):
+    if regtype == "Q":
+        f.write(
+            f"    /* {regtype}{regid}V is *(MMQReg *)" f"({regtype}{regid}V_void) */\n"
+        )
     else:
-        f.write(f"    /* {regtype}{regid}V is *(MMVector *)"
-                f"({regtype}{regid}V_void) */\n")
+        f.write(
+            f"    /* {regtype}{regid}V is *(MMVector *)"
+            f"({regtype}{regid}V_void) */\n"
+        )
+
 
-def gen_helper_dest_decl_ext_pair(f,regtype,regid,regno):
-    f.write(f"    /* {regtype}{regid}V is *(MMVectorPair *))"
-            f"{regtype}{regid}V_void) */\n")
+def gen_helper_dest_decl_ext_pair(f, regtype, regid, regno):
+    f.write(
+        f"    /* {regtype}{regid}V is *(MMVectorPair *))"
+        f"{regtype}{regid}V_void) */\n"
+    )
 
-def gen_helper_dest_decl_opn(f,regtype,regid,i):
-    if (hex_common.is_pair(regid)):
-        if (hex_common.is_hvx_reg(regtype)):
-            gen_helper_dest_decl_ext_pair(f,regtype,regid, i)
+
+def gen_helper_dest_decl_opn(f, regtype, regid, i):
+    if hex_common.is_pair(regid):
+        if hex_common.is_hvx_reg(regtype):
+            gen_helper_dest_decl_ext_pair(f, regtype, regid, i)
         else:
-            gen_helper_dest_decl_pair(f,regtype,regid,i)
-    elif (hex_common.is_single(regid)):
-        if (hex_common.is_hvx_reg(regtype)):
-            gen_helper_dest_decl_ext(f,regtype,regid)
+            gen_helper_dest_decl_pair(f, regtype, regid, i)
+    elif hex_common.is_single(regid):
+        if hex_common.is_hvx_reg(regtype):
+            gen_helper_dest_decl_ext(f, regtype, regid)
         else:
-            gen_helper_dest_decl(f,regtype,regid,i)
+            gen_helper_dest_decl(f, regtype, regid, i)
     else:
-        print("Bad register parse: ",regtype,regid,toss,numregs)
+        print("Bad register parse: ", regtype, regid, toss, numregs)
+
 
-def gen_helper_src_var_ext(f,regtype,regid):
-    if (regtype == "Q"):
-       f.write(f"    /* {regtype}{regid}V is *(MMQReg *)"
-               f"({regtype}{regid}V_void) */\n")
+def gen_helper_src_var_ext(f, regtype, regid):
+    if regtype == "Q":
+        f.write(
+            f"    /* {regtype}{regid}V is *(MMQReg *)" f"({regtype}{regid}V_void) */\n"
+        )
     else:
-       f.write(f"    /* {regtype}{regid}V is *(MMVector *)"
-               f"({regtype}{regid}V_void) */\n")
+        f.write(
+            f"    /* {regtype}{regid}V is *(MMVector *)"
+            f"({regtype}{regid}V_void) */\n"
+        )
+
+
+def gen_helper_src_var_ext_pair(f, regtype, regid, regno):
+    f.write(
+        f"    /* {regtype}{regid}V{regno} is *(MMVectorPair *)"
+        f"({regtype}{regid}V{regno}_void) */\n"
+    )
 
-def gen_helper_src_var_ext_pair(f,regtype,regid,regno):
-    f.write(f"    /* {regtype}{regid}V{regno} is *(MMVectorPair *)"
-            f"({regtype}{regid}V{regno}_void) */\n")
 
-def gen_helper_return(f,regtype,regid,regno):
+def gen_helper_return(f, regtype, regid, regno):
     f.write(f"    return {regtype}{regid}V;\n")
 
-def gen_helper_return_pair(f,regtype,regid,regno):
+
+def gen_helper_return_pair(f, regtype, regid, regno):
     f.write(f"    return {regtype}{regid}V;\n")
 
-def gen_helper_dst_write_ext(f,regtype,regid):
+
+def gen_helper_dst_write_ext(f, regtype, regid):
     return
 
-def gen_helper_dst_write_ext_pair(f,regtype,regid):
+
+def gen_helper_dst_write_ext_pair(f, regtype, regid):
     return
 
+
 def gen_helper_return_opn(f, regtype, regid, i):
-    if (hex_common.is_pair(regid)):
-        if (hex_common.is_hvx_reg(regtype)):
-            gen_helper_dst_write_ext_pair(f,regtype,regid)
+    if hex_common.is_pair(regid):
+        if hex_common.is_hvx_reg(regtype):
+            gen_helper_dst_write_ext_pair(f, regtype, regid)
         else:
-            gen_helper_return_pair(f,regtype,regid,i)
-    elif (hex_common.is_single(regid)):
-        if (hex_common.is_hvx_reg(regtype)):
-            gen_helper_dst_write_ext(f,regtype,regid)
+            gen_helper_return_pair(f, regtype, regid, i)
+    elif hex_common.is_single(regid):
+        if hex_common.is_hvx_reg(regtype):
+            gen_helper_dst_write_ext(f, regtype, regid)
         else:
-            gen_helper_return(f,regtype,regid,i)
+            gen_helper_return(f, regtype, regid, i)
     else:
-        print("Bad register parse: ",regtype,regid,toss,numregs)
+        print("Bad register parse: ", regtype, regid, toss, numregs)
+
 
 ##
 ## Generate the TCG code to call the helper
@@ -168,138 +208,145 @@ def gen_helper_function(f, tag, tagregs, tagimms):
     numresults = 0
     numscalarresults = 0
     numscalarreadwrite = 0
-    for regtype,regid,toss,numregs in regs:
-        if (hex_common.is_written(regid)):
+    for regtype, regid, toss, numregs in regs:
+        if hex_common.is_written(regid):
             numresults += 1
-            if (hex_common.is_scalar_reg(regtype)):
+            if hex_common.is_scalar_reg(regtype):
                 numscalarresults += 1
-        if (hex_common.is_readwrite(regid)):
-            if (hex_common.is_scalar_reg(regtype)):
+        if hex_common.is_readwrite(regid):
+            if hex_common.is_scalar_reg(regtype):
                 numscalarreadwrite += 1
 
-    if (numscalarresults > 1):
+    if numscalarresults > 1:
         ## The helper is bogus when there is more than one result
-        f.write(f"void HELPER({tag})(CPUHexagonState *env) "
-                f"{{ BOGUS_HELPER({tag}); }}\n")
+        f.write(
+            f"void HELPER({tag})(CPUHexagonState *env) " f"{{ BOGUS_HELPER({tag}); }}\n"
+        )
     else:
         ## The return type of the function is the type of the destination
         ## register (if scalar)
-        i=0
-        for regtype,regid,toss,numregs in regs:
-            if (hex_common.is_written(regid)):
-                if (hex_common.is_pair(regid)):
-                    if (hex_common.is_hvx_reg(regtype)):
+        i = 0
+        for regtype, regid, toss, numregs in regs:
+            if hex_common.is_written(regid):
+                if hex_common.is_pair(regid):
+                    if hex_common.is_hvx_reg(regtype):
                         continue
                     else:
-                        gen_helper_return_type_pair(f,regtype,regid,i)
-                elif (hex_common.is_single(regid)):
-                    if (hex_common.is_hvx_reg(regtype)):
-                            continue
+                        gen_helper_return_type_pair(f, regtype, regid, i)
+                elif hex_common.is_single(regid):
+                    if hex_common.is_hvx_reg(regtype):
+                        continue
                     else:
-                        gen_helper_return_type(f,regtype,regid,i)
+                        gen_helper_return_type(f, regtype, regid, i)
                 else:
-                    print("Bad register parse: ",regtype,regid,toss,numregs)
+                    print("Bad register parse: ", regtype, regid, toss, numregs)
             i += 1
 
-        if (numscalarresults == 0):
+        if numscalarresults == 0:
             f.write("void")
         f.write(f" HELPER({tag})(CPUHexagonState *env")
 
         ## Arguments include the vector destination operands
         i = 1
-        for regtype,regid,toss,numregs in regs:
-            if (hex_common.is_written(regid)):
-                if (hex_common.is_pair(regid)):
-                    if (hex_common.is_hvx_reg(regtype)):
-                        gen_helper_arg_ext_pair(f,regtype,regid,i)
+        for regtype, regid, toss, numregs in regs:
+            if hex_common.is_written(regid):
+                if hex_common.is_pair(regid):
+                    if hex_common.is_hvx_reg(regtype):
+                        gen_helper_arg_ext_pair(f, regtype, regid, i)
                     else:
                         continue
-                elif (hex_common.is_single(regid)):
-                    if (hex_common.is_hvx_reg(regtype)):
-                        gen_helper_arg_ext(f,regtype,regid,i)
+                elif hex_common.is_single(regid):
+                    if hex_common.is_hvx_reg(regtype):
+                        gen_helper_arg_ext(f, regtype, regid, i)
                     else:
                         # This is the return value of the function
                         continue
                 else:
-                    print("Bad register parse: ",regtype,regid,toss,numregs)
+                    print("Bad register parse: ", regtype, regid, toss, numregs)
                 i += 1
 
         ## For conditional instructions, we pass in the destination register
-        if 'A_CONDEXEC' in hex_common.attribdict[tag]:
+        if "A_CONDEXEC" in hex_common.attribdict[tag]:
             for regtype, regid, toss, numregs in regs:
-                if (hex_common.is_writeonly(regid) and
-                    not hex_common.is_hvx_reg(regtype)):
+                if hex_common.is_writeonly(regid) and not hex_common.is_hvx_reg(
+                    regtype
+                ):
                     gen_helper_arg_opn(f, regtype, regid, i, tag)
                     i += 1
 
         ## Arguments to the helper function are the source regs and immediates
-        for regtype,regid,toss,numregs in regs:
-            if (hex_common.is_read(regid)):
-                if (hex_common.is_hvx_reg(regtype) and
-                    hex_common.is_readwrite(regid)):
+        for regtype, regid, toss, numregs in regs:
+            if hex_common.is_read(regid):
+                if hex_common.is_hvx_reg(regtype) and hex_common.is_readwrite(regid):
                     continue
-                gen_helper_arg_opn(f,regtype,regid,i,tag)
+                gen_helper_arg_opn(f, regtype, regid, i, tag)
                 i += 1
-        for immlett,bits,immshift in imms:
-            gen_helper_arg_imm(f,immlett)
+        for immlett, bits, immshift in imms:
+            gen_helper_arg_imm(f, immlett)
             i += 1
 
-        if (hex_common.need_pkt_has_multi_cof(tag)):
+        if hex_common.need_pkt_has_multi_cof(tag):
             f.write(", uint32_t pkt_has_multi_cof")
 
         if hex_common.need_PC(tag):
-            if i > 0: f.write(", ")
+            if i > 0:
+                f.write(", ")
             f.write("target_ulong PC")
             i += 1
         if hex_common.helper_needs_next_PC(tag):
-            if i > 0: f.write(", ")
+            if i > 0:
+                f.write(", ")
             f.write("target_ulong next_PC")
             i += 1
         if hex_common.need_slot(tag):
-            if i > 0: f.write(", ")
+            if i > 0:
+                f.write(", ")
             f.write("uint32_t slot")
             i += 1
         if hex_common.need_part1(tag):
-            if i > 0: f.write(", ")
+            if i > 0:
+                f.write(", ")
             f.write("uint32_t part1")
         f.write(")\n{\n")
-        if (not hex_common.need_slot(tag)):
-            f.write("    uint32_t slot __attribute__((unused)) = 4;\n" )
-        if hex_common.need_ea(tag): gen_decl_ea(f)
+        if not hex_common.need_slot(tag):
+            f.write("    uint32_t slot __attribute__((unused)) = 4;\n")
+        if hex_common.need_ea(tag):
+            gen_decl_ea(f)
         ## Declare the return variable
-        i=0
-        if 'A_CONDEXEC' not in hex_common.attribdict[tag]:
-            for regtype,regid,toss,numregs in regs:
-                if (hex_common.is_writeonly(regid)):
-                    gen_helper_dest_decl_opn(f,regtype,regid,i)
+        i = 0
+        if "A_CONDEXEC" not in hex_common.attribdict[tag]:
+            for regtype, regid, toss, numregs in regs:
+                if hex_common.is_writeonly(regid):
+                    gen_helper_dest_decl_opn(f, regtype, regid, i)
                 i += 1
 
-        for regtype,regid,toss,numregs in regs:
-            if (hex_common.is_read(regid)):
-                if (hex_common.is_pair(regid)):
-                    if (hex_common.is_hvx_reg(regtype)):
-                        gen_helper_src_var_ext_pair(f,regtype,regid,i)
-                elif (hex_common.is_single(regid)):
-                    if (hex_common.is_hvx_reg(regtype)):
-                        gen_helper_src_var_ext(f,regtype,regid)
+        for regtype, regid, toss, numregs in regs:
+            if hex_common.is_read(regid):
+                if hex_common.is_pair(regid):
+                    if hex_common.is_hvx_reg(regtype):
+                        gen_helper_src_var_ext_pair(f, regtype, regid, i)
+                elif hex_common.is_single(regid):
+                    if hex_common.is_hvx_reg(regtype):
+                        gen_helper_src_var_ext(f, regtype, regid)
                 else:
-                    print("Bad register parse: ",regtype,regid,toss,numregs)
+                    print("Bad register parse: ", regtype, regid, toss, numregs)
 
-        if 'A_FPOP' in hex_common.attribdict[tag]:
-            f.write('    arch_fpop_start(env);\n');
+        if "A_FPOP" in hex_common.attribdict[tag]:
+            f.write("    arch_fpop_start(env);\n")
 
         f.write(f"    {hex_common.semdict[tag]}\n")
 
-        if 'A_FPOP' in hex_common.attribdict[tag]:
-            f.write('    arch_fpop_end(env);\n');
+        if "A_FPOP" in hex_common.attribdict[tag]:
+            f.write("    arch_fpop_end(env);\n")
 
         ## Save/return the return variable
-        for regtype,regid,toss,numregs in regs:
-            if (hex_common.is_written(regid)):
+        for regtype, regid, toss, numregs in regs:
+            if hex_common.is_written(regid):
                 gen_helper_return_opn(f, regtype, regid, i)
         f.write("}\n\n")
         ## End of the helper definition
 
+
 def main():
     hex_common.read_semantics_file(sys.argv[1])
     hex_common.read_attribs_file(sys.argv[2])
@@ -322,27 +369,28 @@ def main():
     tagimms = hex_common.get_tagimms()
 
     output_file = sys.argv[-1]
-    with open(output_file, 'w') as f:
+    with open(output_file, "w") as f:
         for tag in hex_common.tags:
             ## Skip the priv instructions
-            if ( "A_PRIV" in hex_common.attribdict[tag] ) :
+            if "A_PRIV" in hex_common.attribdict[tag]:
                 continue
             ## Skip the guest instructions
-            if ( "A_GUEST" in hex_common.attribdict[tag] ) :
+            if "A_GUEST" in hex_common.attribdict[tag]:
                 continue
             ## Skip the diag instructions
-            if ( tag == "Y6_diag" ) :
+            if tag == "Y6_diag":
                 continue
-            if ( tag == "Y6_diag0" ) :
+            if tag == "Y6_diag0":
                 continue
-            if ( tag == "Y6_diag1" ) :
+            if tag == "Y6_diag1":
                 continue
-            if ( hex_common.skip_qemu_helper(tag) ):
+            if hex_common.skip_qemu_helper(tag):
                 continue
-            if ( hex_common.is_idef_parser_enabled(tag) ):
+            if hex_common.is_idef_parser_enabled(tag):
                 continue
 
             gen_helper_function(f, tag, tagregs, tagimms)
 
+
 if __name__ == "__main__":
     main()
diff --git a/target/hexagon/gen_helper_protos.py b/target/hexagon/gen_helper_protos.py
index d795f32047..187cd6e04e 100755
--- a/target/hexagon/gen_helper_protos.py
+++ b/target/hexagon/gen_helper_protos.py
@@ -26,32 +26,34 @@
 ## Helpers for gen_helper_prototype
 ##
 def_helper_types = {
-    'N' : 's32',
-    'O' : 's32',
-    'P' : 's32',
-    'M' : 's32',
-    'C' : 's32',
-    'R' : 's32',
-    'V' : 'ptr',
-    'Q' : 'ptr'
+    "N": "s32",
+    "O": "s32",
+    "P": "s32",
+    "M": "s32",
+    "C": "s32",
+    "R": "s32",
+    "V": "ptr",
+    "Q": "ptr",
 }
 
 def_helper_types_pair = {
-    'R' : 's64',
-    'C' : 's64',
-    'S' : 's64',
-    'G' : 's64',
-    'V' : 'ptr',
-    'Q' : 'ptr'
+    "R": "s64",
+    "C": "s64",
+    "S": "s64",
+    "G": "s64",
+    "V": "ptr",
+    "Q": "ptr",
 }
 
+
 def gen_def_helper_opn(f, tag, regtype, regid, toss, numregs, i):
-    if (hex_common.is_pair(regid)):
+    if hex_common.is_pair(regid):
         f.write(f", {def_helper_types_pair[regtype]}")
-    elif (hex_common.is_single(regid)):
+    elif hex_common.is_single(regid):
         f.write(f", {def_helper_types[regtype]}")
     else:
-        print("Bad register parse: ",regtype,regid,toss,numregs)
+        print("Bad register parse: ", regtype, regid, toss, numregs)
+
 
 ##
 ## Generate the DEF_HELPER prototype for an instruction
@@ -66,90 +68,108 @@ def gen_helper_prototype(f, tag, tagregs, tagimms):
     numresults = 0
     numscalarresults = 0
     numscalarreadwrite = 0
-    for regtype,regid,toss,numregs in regs:
-        if (hex_common.is_written(regid)):
+    for regtype, regid, toss, numregs in regs:
+        if hex_common.is_written(regid):
             numresults += 1
-            if (hex_common.is_scalar_reg(regtype)):
+            if hex_common.is_scalar_reg(regtype):
                 numscalarresults += 1
-        if (hex_common.is_readwrite(regid)):
-            if (hex_common.is_scalar_reg(regtype)):
+        if hex_common.is_readwrite(regid):
+            if hex_common.is_scalar_reg(regtype):
                 numscalarreadwrite += 1
 
-    if (numscalarresults > 1):
+    if numscalarresults > 1:
         ## The helper is bogus when there is more than one result
-        f.write(f'DEF_HELPER_1({tag}, void, env)\n')
+        f.write(f"DEF_HELPER_1({tag}, void, env)\n")
     else:
         ## Figure out how many arguments the helper will take
-        if (numscalarresults == 0):
-            def_helper_size = len(regs)+len(imms)+numscalarreadwrite+1
-            if hex_common.need_pkt_has_multi_cof(tag): def_helper_size += 1
-            if hex_common.need_part1(tag): def_helper_size += 1
-            if hex_common.need_slot(tag): def_helper_size += 1
-            if hex_common.need_PC(tag): def_helper_size += 1
-            if hex_common.helper_needs_next_PC(tag): def_helper_size += 1
-            if hex_common.need_condexec_reg(tag, regs): def_helper_size += 1
-            f.write(f'DEF_HELPER_{def_helper_size}({tag}')
+        if numscalarresults == 0:
+            def_helper_size = len(regs) + len(imms) + numscalarreadwrite + 1
+            if hex_common.need_pkt_has_multi_cof(tag):
+                def_helper_size += 1
+            if hex_common.need_part1(tag):
+                def_helper_size += 1
+            if hex_common.need_slot(tag):
+                def_helper_size += 1
+            if hex_common.need_PC(tag):
+                def_helper_size += 1
+            if hex_common.helper_needs_next_PC(tag):
+                def_helper_size += 1
+            if hex_common.need_condexec_reg(tag, regs):
+                def_helper_size += 1
+            f.write(f"DEF_HELPER_{def_helper_size}({tag}")
             ## The return type is void
-            f.write(', void' )
+            f.write(", void")
         else:
-            def_helper_size = len(regs)+len(imms)+numscalarreadwrite
-            if hex_common.need_pkt_has_multi_cof(tag): def_helper_size += 1
-            if hex_common.need_part1(tag): def_helper_size += 1
-            if hex_common.need_slot(tag): def_helper_size += 1
-            if hex_common.need_PC(tag): def_helper_size += 1
-            if hex_common.need_condexec_reg(tag, regs): def_helper_size += 1
-            if hex_common.helper_needs_next_PC(tag): def_helper_size += 1
-            f.write(f'DEF_HELPER_{def_helper_size}({tag}')
+            def_helper_size = len(regs) + len(imms) + numscalarreadwrite
+            if hex_common.need_pkt_has_multi_cof(tag):
+                def_helper_size += 1
+            if hex_common.need_part1(tag):
+                def_helper_size += 1
+            if hex_common.need_slot(tag):
+                def_helper_size += 1
+            if hex_common.need_PC(tag):
+                def_helper_size += 1
+            if hex_common.need_condexec_reg(tag, regs):
+                def_helper_size += 1
+            if hex_common.helper_needs_next_PC(tag):
+                def_helper_size += 1
+            f.write(f"DEF_HELPER_{def_helper_size}({tag}")
 
         ## Generate the qemu DEF_HELPER type for each result
         ## Iterate over this list twice
         ## - Emit the scalar result
         ## - Emit the vector result
-        i=0
-        for regtype,regid,toss,numregs in regs:
-            if (hex_common.is_written(regid)):
-                if (not hex_common.is_hvx_reg(regtype)):
+        i = 0
+        for regtype, regid, toss, numregs in regs:
+            if hex_common.is_written(regid):
+                if not hex_common.is_hvx_reg(regtype):
                     gen_def_helper_opn(f, tag, regtype, regid, toss, numregs, i)
                 i += 1
 
         ## Put the env between the outputs and inputs
-        f.write(', env' )
+        f.write(", env")
         i += 1
 
         # Second pass
-        for regtype,regid,toss,numregs in regs:
-            if (hex_common.is_written(regid)):
-                if (hex_common.is_hvx_reg(regtype)):
+        for regtype, regid, toss, numregs in regs:
+            if hex_common.is_written(regid):
+                if hex_common.is_hvx_reg(regtype):
                     gen_def_helper_opn(f, tag, regtype, regid, toss, numregs, i)
                     i += 1
 
         ## For conditional instructions, we pass in the destination register
-        if 'A_CONDEXEC' in hex_common.attribdict[tag]:
+        if "A_CONDEXEC" in hex_common.attribdict[tag]:
             for regtype, regid, toss, numregs in regs:
-                if (hex_common.is_writeonly(regid) and
-                    not hex_common.is_hvx_reg(regtype)):
+                if hex_common.is_writeonly(regid) and not hex_common.is_hvx_reg(
+                    regtype
+                ):
                     gen_def_helper_opn(f, tag, regtype, regid, toss, numregs, i)
                     i += 1
 
         ## Generate the qemu type for each input operand (regs and immediates)
-        for regtype,regid,toss,numregs in regs:
-            if (hex_common.is_read(regid)):
-                if (hex_common.is_hvx_reg(regtype) and
-                    hex_common.is_readwrite(regid)):
+        for regtype, regid, toss, numregs in regs:
+            if hex_common.is_read(regid):
+                if hex_common.is_hvx_reg(regtype) and hex_common.is_readwrite(regid):
                     continue
                 gen_def_helper_opn(f, tag, regtype, regid, toss, numregs, i)
                 i += 1
-        for immlett,bits,immshift in imms:
+        for immlett, bits, immshift in imms:
             f.write(", s32")
 
         ## Add the arguments for the instruction pkt_has_multi_cof, slot and
         ## part1 (if needed)
-        if hex_common.need_pkt_has_multi_cof(tag): f.write(', i32')
-        if hex_common.need_PC(tag): f.write(', i32')
-        if hex_common.helper_needs_next_PC(tag): f.write(', i32')
-        if hex_common.need_slot(tag): f.write(', i32' )
-        if hex_common.need_part1(tag): f.write(' , i32' )
-        f.write(')\n')
+        if hex_common.need_pkt_has_multi_cof(tag):
+            f.write(", i32")
+        if hex_common.need_PC(tag):
+            f.write(", i32")
+        if hex_common.helper_needs_next_PC(tag):
+            f.write(", i32")
+        if hex_common.need_slot(tag):
+            f.write(", i32")
+        if hex_common.need_part1(tag):
+            f.write(" , i32")
+        f.write(")\n")
+
 
 def main():
     hex_common.read_semantics_file(sys.argv[1])
@@ -173,28 +193,29 @@ def main():
     tagimms = hex_common.get_tagimms()
 
     output_file = sys.argv[-1]
-    with open(output_file, 'w') as f:
+    with open(output_file, "w") as f:
         for tag in hex_common.tags:
             ## Skip the priv instructions
-            if ( "A_PRIV" in hex_common.attribdict[tag] ) :
+            if "A_PRIV" in hex_common.attribdict[tag]:
                 continue
             ## Skip the guest instructions
-            if ( "A_GUEST" in hex_common.attribdict[tag] ) :
+            if "A_GUEST" in hex_common.attribdict[tag]:
                 continue
             ## Skip the diag instructions
-            if ( tag == "Y6_diag" ) :
+            if tag == "Y6_diag":
                 continue
-            if ( tag == "Y6_diag0" ) :
+            if tag == "Y6_diag0":
                 continue
-            if ( tag == "Y6_diag1" ) :
+            if tag == "Y6_diag1":
                 continue
 
-            if ( hex_common.skip_qemu_helper(tag) ):
+            if hex_common.skip_qemu_helper(tag):
                 continue
-            if ( hex_common.is_idef_parser_enabled(tag) ):
+            if hex_common.is_idef_parser_enabled(tag):
                 continue
 
             gen_helper_prototype(f, tag, tagregs, tagimms)
 
+
 if __name__ == "__main__":
     main()
diff --git a/target/hexagon/gen_idef_parser_funcs.py b/target/hexagon/gen_idef_parser_funcs.py
index 60be8e37b6..2cc0f58ec5 100644
--- a/target/hexagon/gen_idef_parser_funcs.py
+++ b/target/hexagon/gen_idef_parser_funcs.py
@@ -24,6 +24,7 @@
 
 import hex_common
 
+
 ##
 ## Generate code to be fed to the idef_parser
 ##
@@ -48,83 +49,99 @@ def main():
     tagregs = hex_common.get_tagregs()
     tagimms = hex_common.get_tagimms()
 
-    with open(sys.argv[3], 'w') as f:
+    with open(sys.argv[3], "w") as f:
         f.write('#include "macros.inc"\n\n')
 
         for tag in hex_common.tags:
             ## Skip the priv instructions
-            if ( "A_PRIV" in hex_common.attribdict[tag] ) :
+            if "A_PRIV" in hex_common.attribdict[tag]:
                 continue
             ## Skip the guest instructions
-            if ( "A_GUEST" in hex_common.attribdict[tag] ) :
+            if "A_GUEST" in hex_common.attribdict[tag]:
                 continue
             ## Skip instructions that saturate in a ternary expression
-            if ( tag in {'S2_asr_r_r_sat', 'S2_asl_r_r_sat'} ) :
+            if tag in {"S2_asr_r_r_sat", "S2_asl_r_r_sat"}:
                 continue
             ## Skip instructions using switch
-            if ( tag in {'S4_vrcrotate_acc', 'S4_vrcrotate'} ) :
+            if tag in {"S4_vrcrotate_acc", "S4_vrcrotate"}:
                 continue
             ## Skip trap instructions
-            if ( tag in {'J2_trap0', 'J2_trap1'} ) :
+            if tag in {"J2_trap0", "J2_trap1"}:
                 continue
             ## Skip 128-bit instructions
-            if ( tag in {'A7_croundd_ri', 'A7_croundd_rr'} ) :
+            if tag in {"A7_croundd_ri", "A7_croundd_rr"}:
                 continue
-            if ( tag in {'M7_wcmpyrw', 'M7_wcmpyrwc',
-                         'M7_wcmpyiw', 'M7_wcmpyiwc',
-                         'M7_wcmpyrw_rnd', 'M7_wcmpyrwc_rnd',
-                         'M7_wcmpyiw_rnd', 'M7_wcmpyiwc_rnd'} ) :
+            if tag in {
+                "M7_wcmpyrw",
+                "M7_wcmpyrwc",
+                "M7_wcmpyiw",
+                "M7_wcmpyiwc",
+                "M7_wcmpyrw_rnd",
+                "M7_wcmpyrwc_rnd",
+                "M7_wcmpyiw_rnd",
+                "M7_wcmpyiwc_rnd",
+            }:
                 continue
             ## Skip interleave/deinterleave instructions
-            if ( tag in {'S2_interleave', 'S2_deinterleave'} ) :
+            if tag in {"S2_interleave", "S2_deinterleave"}:
                 continue
             ## Skip instructions using bit reverse
-            if ( tag in {'S2_brev', 'S2_brevp', 'S2_ct0', 'S2_ct1',
-                         'S2_ct0p', 'S2_ct1p', 'A4_tlbmatch'} ) :
+            if tag in {
+                "S2_brev",
+                "S2_brevp",
+                "S2_ct0",
+                "S2_ct1",
+                "S2_ct0p",
+                "S2_ct1p",
+                "A4_tlbmatch",
+            }:
                 continue
             ## Skip other unsupported instructions
-            if ( tag == 'S2_cabacdecbin' or tag == 'A5_ACS' ) :
+            if tag == "S2_cabacdecbin" or tag == "A5_ACS":
                 continue
-            if ( tag.startswith('Y') ) :
+            if tag.startswith("Y"):
                 continue
-            if ( tag.startswith('V6_') ) :
+            if tag.startswith("V6_"):
                 continue
-            if ( tag.startswith('F') ) :
+            if tag.startswith("F"):
                 continue
-            if ( tag.endswith('_locked') ) :
+            if tag.endswith("_locked"):
                 continue
-            if ( "A_COF" in hex_common.attribdict[tag] ) :
+            if "A_COF" in hex_common.attribdict[tag]:
                 continue
 
             regs = tagregs[tag]
             imms = tagimms[tag]
 
             arguments = []
-            for regtype,regid,toss,numregs in regs:
+            for regtype, regid, toss, numregs in regs:
                 prefix = "in " if hex_common.is_read(regid) else ""
 
                 is_pair = hex_common.is_pair(regid)
-                is_single_old = (hex_common.is_single(regid)
-                                 and hex_common.is_old_val(regtype, regid, tag))
-                is_single_new = (hex_common.is_single(regid)
-                                 and hex_common.is_new_val(regtype, regid, tag))
+                is_single_old = hex_common.is_single(regid) and hex_common.is_old_val(
+                    regtype, regid, tag
+                )
+                is_single_new = hex_common.is_single(regid) and hex_common.is_new_val(
+                    regtype, regid, tag
+                )
 
                 if is_pair or is_single_old:
                     arguments.append(f"{prefix}{regtype}{regid}V")
                 elif is_single_new:
                     arguments.append(f"{prefix}{regtype}{regid}N")
                 else:
-                    print("Bad register parse: ",regtype,regid,toss,numregs)
+                    print("Bad register parse: ", regtype, regid, toss, numregs)
 
-            for immlett,bits,immshift in imms:
+            for immlett, bits, immshift in imms:
                 arguments.append(hex_common.imm_name(immlett))
 
             f.write(f"{tag}({', '.join(arguments)}) {{\n")
-            f.write("    ");
+            f.write("    ")
             if hex_common.need_ea(tag):
-                f.write("size4u_t EA; ");
+                f.write("size4u_t EA; ")
             f.write(f"{hex_common.semdict[tag]}\n")
             f.write("}\n\n")
 
+
 if __name__ == "__main__":
     main()
diff --git a/target/hexagon/gen_op_attribs.py b/target/hexagon/gen_op_attribs.py
index fc705375d4..1718c325c7 100755
--- a/target/hexagon/gen_op_attribs.py
+++ b/target/hexagon/gen_op_attribs.py
@@ -22,6 +22,7 @@
 import string
 import hex_common
 
+
 def main():
     hex_common.read_semantics_file(sys.argv[1])
     hex_common.read_attribs_file(sys.argv[2])
@@ -30,10 +31,13 @@ def main():
     ##
     ##     Generate all the attributes associated with each instruction
     ##
-    with open(sys.argv[3], 'w') as f:
+    with open(sys.argv[3], "w") as f:
         for tag in hex_common.tags:
-            f.write(f'OP_ATTRIB({tag},ATTRIBS('
-                    f'{",".join(sorted(hex_common.attribdict[tag]))}))\n')
+            f.write(
+                f"OP_ATTRIB({tag},ATTRIBS("
+                f'{",".join(sorted(hex_common.attribdict[tag]))}))\n'
+            )
+
 
 if __name__ == "__main__":
     main()
diff --git a/target/hexagon/gen_op_regs.py b/target/hexagon/gen_op_regs.py
index 5f0ae20722..96fc2bbf94 100755
--- a/target/hexagon/gen_op_regs.py
+++ b/target/hexagon/gen_op_regs.py
@@ -22,21 +22,25 @@
 import string
 import hex_common
 
+
 ##
 ##     Generate the register and immediate operands for each instruction
 ##
 def calculate_regid_reg(tag):
-    def letter_inc(x): return chr(ord(x)+1)
-    ordered_implregs = [ 'SP','FP','LR' ]
-    srcdst_lett = 'X'
-    src_lett = 'S'
-    dst_lett = 'D'
+    def letter_inc(x):
+        return chr(ord(x) + 1)
+
+    ordered_implregs = ["SP", "FP", "LR"]
+    srcdst_lett = "X"
+    src_lett = "S"
+    dst_lett = "D"
     retstr = ""
     mapdict = {}
     for reg in ordered_implregs:
         reg_rd = 0
         reg_wr = 0
-        if ('A_IMPLICIT_WRITES_'+reg) in hex_common.attribdict[tag]: reg_wr = 1
+        if ("A_IMPLICIT_WRITES_" + reg) in hex_common.attribdict[tag]:
+            reg_wr = 1
         if reg_rd and reg_wr:
             retstr += srcdst_lett
             mapdict[srcdst_lett] = reg
@@ -49,16 +53,19 @@ def letter_inc(x): return chr(ord(x)+1)
             retstr += dst_lett
             mapdict[dst_lett] = reg
             dst_lett = letter_inc(dst_lett)
-    return retstr,mapdict
+    return retstr, mapdict
+
 
 def calculate_regid_letters(tag):
-    retstr,mapdict = calculate_regid_reg(tag)
+    retstr, mapdict = calculate_regid_reg(tag)
     return retstr
 
+
 def strip_reg_prefix(x):
-    y=x.replace('UREG.','')
-    y=y.replace('MREG.','')
-    return y.replace('GREG.','')
+    y = x.replace("UREG.", "")
+    y = y.replace("MREG.", "")
+    return y.replace("GREG.", "")
+
 
 def main():
     hex_common.read_semantics_file(sys.argv[1])
@@ -66,45 +73,51 @@ def main():
     tagregs = hex_common.get_tagregs()
     tagimms = hex_common.get_tagimms()
 
-    with open(sys.argv[3], 'w') as f:
+    with open(sys.argv[3], "w") as f:
         for tag in hex_common.tags:
             regs = tagregs[tag]
             rregs = []
             wregs = []
             regids = ""
-            for regtype,regid,toss,numregs in regs:
+            for regtype, regid, toss, numregs in regs:
                 if hex_common.is_read(regid):
-                    if regid[0] not in regids: regids += regid[0]
-                    rregs.append(regtype+regid+numregs)
+                    if regid[0] not in regids:
+                        regids += regid[0]
+                    rregs.append(regtype + regid + numregs)
                 if hex_common.is_written(regid):
-                    wregs.append(regtype+regid+numregs)
-                    if regid[0] not in regids: regids += regid[0]
+                    wregs.append(regtype + regid + numregs)
+                    if regid[0] not in regids:
+                        regids += regid[0]
             for attrib in hex_common.attribdict[tag]:
-                if hex_common.attribinfo[attrib]['rreg']:
-                    rregs.append(strip_reg_prefix(attribinfo[attrib]['rreg']))
-                if hex_common.attribinfo[attrib]['wreg']:
-                    wregs.append(strip_reg_prefix(attribinfo[attrib]['wreg']))
+                if hex_common.attribinfo[attrib]["rreg"]:
+                    rregs.append(strip_reg_prefix(attribinfo[attrib]["rreg"]))
+                if hex_common.attribinfo[attrib]["wreg"]:
+                    wregs.append(strip_reg_prefix(attribinfo[attrib]["wreg"]))
             regids += calculate_regid_letters(tag)
-            f.write(f'REGINFO({tag},"{regids}",\t/*RD:*/\t"{",".join(rregs)}",'
-                    f'\t/*WR:*/\t"{",".join(wregs)}")\n')
+            f.write(
+                f'REGINFO({tag},"{regids}",\t/*RD:*/\t"{",".join(rregs)}",'
+                f'\t/*WR:*/\t"{",".join(wregs)}")\n'
+            )
 
         for tag in hex_common.tags:
             imms = tagimms[tag]
-            f.write(f'IMMINFO({tag}')
+            f.write(f"IMMINFO({tag}")
             if not imms:
-                f.write(''','u',0,0,'U',0,0''')
-            for sign,size,shamt in imms:
-                if sign == 'r': sign = 's'
+                f.write(""",'u',0,0,'U',0,0""")
+            for sign, size, shamt in imms:
+                if sign == "r":
+                    sign = "s"
                 if not shamt:
                     shamt = "0"
-                f.write(f''','{sign}',{size},{shamt}''')
+                f.write(f""",'{sign}',{size},{shamt}""")
             if len(imms) == 1:
                 if sign.isupper():
-                    myu = 'u'
+                    myu = "u"
                 else:
-                    myu = 'U'
-                f.write(f''','{myu}',0,0''')
-            f.write(')\n')
+                    myu = "U"
+                f.write(f""",'{myu}',0,0""")
+            f.write(")\n")
+
 
 if __name__ == "__main__":
     main()
diff --git a/target/hexagon/gen_opcodes_def.py b/target/hexagon/gen_opcodes_def.py
index 550949cbc6..507b0e2aba 100755
--- a/target/hexagon/gen_opcodes_def.py
+++ b/target/hexagon/gen_opcodes_def.py
@@ -22,15 +22,17 @@
 import string
 import hex_common
 
+
 def main():
     hex_common.read_semantics_file(sys.argv[1])
 
     ##
     ##     Generate a list of all the opcodes
     ##
-    with open(sys.argv[3], 'w') as f:
+    with open(sys.argv[3], "w") as f:
         for tag in hex_common.tags:
             f.write(f"OPCODE({tag}),\n")
 
+
 if __name__ == "__main__":
     main()
diff --git a/target/hexagon/gen_printinsn.py b/target/hexagon/gen_printinsn.py
index fe02572922..75d3c6b6f8 100755
--- a/target/hexagon/gen_printinsn.py
+++ b/target/hexagon/gen_printinsn.py
@@ -22,24 +22,26 @@
 import string
 import hex_common
 
+
 ##
 ##     Generate data for printing each instruction (format string + operands)
 ##
 def regprinter(m):
     str = m.group(1)
-    str += ":".join(["%d"]*len(m.group(2)))
+    str += ":".join(["%d"] * len(m.group(2)))
     str += m.group(3)
-    if ('S' in m.group(1)) and (len(m.group(2)) == 1):
+    if ("S" in m.group(1)) and (len(m.group(2)) == 1):
         str += "/%s"
-    elif ('C' in m.group(1)) and (len(m.group(2)) == 1):
+    elif ("C" in m.group(1)) and (len(m.group(2)) == 1):
         str += "/%s"
     return str
 
+
 def spacify(s):
     # Regular expression that matches any operator that contains '=' character:
-    opswithequal_re = '[-+^&|!<>=]?='
+    opswithequal_re = "[-+^&|!<>=]?="
     # Regular expression that matches any assignment operator.
-    assignment_re = '[-+^&|]?='
+    assignment_re = "[-+^&|]?="
 
     # Out of the operators that contain the = sign, if the operator is also an
     # assignment, spaces will be added around it, unless it's enclosed within
@@ -54,9 +56,9 @@ def spacify(s):
     pc = 0
     while i < slen:
         c = s[i]
-        if c == '(':
+        if c == "(":
             pc += 1
-        elif c == ')':
+        elif c == ")":
             pc -= 1
         paren_count[i] = pc
         i += 1
@@ -76,31 +78,33 @@ def spacify(s):
         if paren_count[ms] == 0:
             # Check if the entire string t is an assignment.
             am = assign.match(t)
-            if am and len(am.group(0)) == me-ms:
+            if am and len(am.group(0)) == me - ms:
                 # Don't add spaces if they are already there.
-                if ms > 0 and s[ms-1] != ' ':
-                    out.append(' ')
+                if ms > 0 and s[ms - 1] != " ":
+                    out.append(" ")
                 out += t
-                if me < slen and s[me] != ' ':
-                    out.append(' ')
+                if me < slen and s[me] != " ":
+                    out.append(" ")
                 continue
         # If this is not an assignment, just append it to the output
         # string.
         out += t
 
     # Append the remaining part of the string.
-    out += s[pos:len(s)]
-    return ''.join(out)
+    out += s[pos : len(s)]
+    return "".join(out)
+
 
 def main():
     hex_common.read_semantics_file(sys.argv[1])
     hex_common.read_attribs_file(sys.argv[2])
 
-    immext_casere = re.compile(r'IMMEXT\(([A-Za-z])')
+    immext_casere = re.compile(r"IMMEXT\(([A-Za-z])")
 
-    with open(sys.argv[3], 'w') as f:
+    with open(sys.argv[3], "w") as f:
         for tag in hex_common.tags:
-            if not hex_common.behdict[tag]: continue
+            if not hex_common.behdict[tag]:
+                continue
             extendable_upper_imm = False
             extendable_lower_imm = False
             m = immext_casere.search(hex_common.semdict[tag])
@@ -110,46 +114,45 @@ def main():
                 else:
                     extendable_lower_imm = True
             beh = hex_common.behdict[tag]
-            beh = hex_common.regre.sub(regprinter,beh)
-            beh = hex_common.absimmre.sub(r"#%s0x%x",beh)
-            beh = hex_common.relimmre.sub(r"PC+%s%d",beh)
+            beh = hex_common.regre.sub(regprinter, beh)
+            beh = hex_common.absimmre.sub(r"#%s0x%x", beh)
+            beh = hex_common.relimmre.sub(r"PC+%s%d", beh)
             beh = spacify(beh)
             # Print out a literal "%s" at the end, used to match empty string
             # so C won't complain at us
-            if ("A_VECX" in hex_common.attribdict[tag]):
+            if "A_VECX" in hex_common.attribdict[tag]:
                 macname = "DEF_VECX_PRINTINFO"
-            else: macname = "DEF_PRINTINFO"
+            else:
+                macname = "DEF_PRINTINFO"
             f.write(f'{macname}({tag},"{beh}%s"')
-            regs_or_imms = \
-                hex_common.reg_or_immre.findall(hex_common.behdict[tag])
+            regs_or_imms = hex_common.reg_or_immre.findall(hex_common.behdict[tag])
             ri = 0
             seenregs = {}
-            for allregs,a,b,c,d,allimm,immlett,bits,immshift in regs_or_imms:
+            for allregs, a, b, c, d, allimm, immlett, bits, immshift in regs_or_imms:
                 if a:
-                    #register
+                    # register
                     if b in seenregs:
                         regno = seenregs[b]
                     else:
                         regno = ri
                     if len(b) == 1:
-                        f.write(f', insn->regno[{regno}]')
-                        if 'S' in a:
-                            f.write(f', sreg2str(insn->regno[{regno}])')
-                        elif 'C' in a:
-                            f.write(f', creg2str(insn->regno[{regno}])')
+                        f.write(f", insn->regno[{regno}]")
+                        if "S" in a:
+                            f.write(f", sreg2str(insn->regno[{regno}])")
+                        elif "C" in a:
+                            f.write(f", creg2str(insn->regno[{regno}])")
                     elif len(b) == 2:
-                        f.write(f', insn->regno[{regno}] + 1'
-                                f', insn->regno[{regno}]')
+                        f.write(f", insn->regno[{regno}] + 1" f", insn->regno[{regno}]")
                     else:
                         print("Put some stuff to handle quads here")
                     if b not in seenregs:
                         seenregs[b] = ri
                         ri += 1
                 else:
-                    #immediate
-                    if (immlett.isupper()):
+                    # immediate
+                    if immlett.isupper():
                         if extendable_upper_imm:
-                            if immlett in 'rR':
+                            if immlett in "rR":
                                 f.write(',insn->extension_valid?"##":""')
                             else:
                                 f.write(',insn->extension_valid?"#":""')
@@ -158,16 +161,17 @@ def main():
                         ii = 1
                     else:
                         if extendable_lower_imm:
-                            if immlett in 'rR':
+                            if immlett in "rR":
                                 f.write(',insn->extension_valid?"##":""')
                             else:
                                 f.write(',insn->extension_valid?"#":""')
                         else:
                             f.write(',""')
                         ii = 0
-                    f.write(f', insn->immed[{ii}]')
+                    f.write(f", insn->immed[{ii}]")
             # append empty string so there is at least one more arg
             f.write(',"")\n')
 
+
 if __name__ == "__main__":
     main()
diff --git a/target/hexagon/gen_shortcode.py b/target/hexagon/gen_shortcode.py
index ea0965d306..5481bec641 100755
--- a/target/hexagon/gen_shortcode.py
+++ b/target/hexagon/gen_shortcode.py
@@ -22,8 +22,10 @@
 import string
 import hex_common
 
+
 def gen_shortcode(f, tag):
-    f.write(f'DEF_SHORTCODE({tag}, {hex_common.semdict[tag]})\n')
+    f.write(f"DEF_SHORTCODE({tag}, {hex_common.semdict[tag]})\n")
+
 
 def main():
     hex_common.read_semantics_file(sys.argv[1])
@@ -32,29 +34,30 @@ def main():
     tagregs = hex_common.get_tagregs()
     tagimms = hex_common.get_tagimms()
 
-    with open(sys.argv[3], 'w') as f:
+    with open(sys.argv[3], "w") as f:
         f.write("#ifndef DEF_SHORTCODE\n")
         f.write("#define DEF_SHORTCODE(TAG,SHORTCODE)    /* Nothing */\n")
         f.write("#endif\n")
 
         for tag in hex_common.tags:
             ## Skip the priv instructions
-            if ( "A_PRIV" in hex_common.attribdict[tag] ) :
+            if "A_PRIV" in hex_common.attribdict[tag]:
                 continue
             ## Skip the guest instructions
-            if ( "A_GUEST" in hex_common.attribdict[tag] ) :
+            if "A_GUEST" in hex_common.attribdict[tag]:
                 continue
             ## Skip the diag instructions
-            if ( tag == "Y6_diag" ) :
+            if tag == "Y6_diag":
                 continue
-            if ( tag == "Y6_diag0" ) :
+            if tag == "Y6_diag0":
                 continue
-            if ( tag == "Y6_diag1" ) :
+            if tag == "Y6_diag1":
                 continue
 
             gen_shortcode(f, tag)
 
         f.write("#undef DEF_SHORTCODE\n")
 
+
 if __name__ == "__main__":
     main()
diff --git a/target/hexagon/gen_tcg_func_table.py b/target/hexagon/gen_tcg_func_table.py
index ec9ca20561..6ee3899717 100755
--- a/target/hexagon/gen_tcg_func_table.py
+++ b/target/hexagon/gen_tcg_func_table.py
@@ -22,6 +22,7 @@
 import string
 import hex_common
 
+
 def main():
     hex_common.read_semantics_file(sys.argv[1])
     hex_common.read_attribs_file(sys.argv[2])
@@ -29,24 +30,24 @@ def main():
     tagregs = hex_common.get_tagregs()
     tagimms = hex_common.get_tagimms()
 
-    with open(sys.argv[3], 'w') as f:
+    with open(sys.argv[3], "w") as f:
         f.write("#ifndef HEXAGON_FUNC_TABLE_H\n")
         f.write("#define HEXAGON_FUNC_TABLE_H\n\n")
 
         f.write("const SemanticInsn opcode_genptr[XX_LAST_OPCODE] = {\n")
         for tag in hex_common.tags:
             ## Skip the priv instructions
-            if ( "A_PRIV" in hex_common.attribdict[tag] ) :
+            if "A_PRIV" in hex_common.attribdict[tag]:
                 continue
             ## Skip the guest instructions
-            if ( "A_GUEST" in hex_common.attribdict[tag] ) :
+            if "A_GUEST" in hex_common.attribdict[tag]:
                 continue
             ## Skip the diag instructions
-            if ( tag == "Y6_diag" ) :
+            if tag == "Y6_diag":
                 continue
-            if ( tag == "Y6_diag0" ) :
+            if tag == "Y6_diag0":
                 continue
-            if ( tag == "Y6_diag1" ) :
+            if tag == "Y6_diag1":
                 continue
 
             f.write(f"    [{tag}] = generate_{tag},\n")
@@ -54,5 +55,6 @@ def main():
 
         f.write("#endif    /* HEXAGON_FUNC_TABLE_H */\n")
 
+
 if __name__ == "__main__":
     main()
diff --git a/target/hexagon/gen_tcg_funcs.py b/target/hexagon/gen_tcg_funcs.py
index 285b3abe3a..fcb3384480 100755
--- a/target/hexagon/gen_tcg_funcs.py
+++ b/target/hexagon/gen_tcg_funcs.py
@@ -22,249 +22,277 @@
 import string
 import hex_common
 
+
 ##
 ## Helpers for gen_tcg_func
 ##
 def gen_decl_ea_tcg(f, tag):
     f.write("    TCGv EA G_GNUC_UNUSED = tcg_temp_new();\n")
 
+
 def genptr_decl_pair_writable(f, tag, regtype, regid, regno):
-    regN=f"{regtype}{regid}N"
-    if (regtype == "R"):
+    regN = f"{regtype}{regid}N"
+    if regtype == "R":
         f.write(f"    const int {regN} = insn->regno[{regno}];\n")
-    elif (regtype == "C"):
+    elif regtype == "C":
         f.write(f"    const int {regN} = insn->regno[{regno}] + HEX_REG_SA0;\n")
     else:
         print("Bad register parse: ", regtype, regid)
-    f.write(f"    TCGv_i64 {regtype}{regid}V = "
-            f"get_result_gpr_pair(ctx, {regN});\n")
+    f.write(f"    TCGv_i64 {regtype}{regid}V = " f"get_result_gpr_pair(ctx, {regN});\n")
+
 
 def genptr_decl_writable(f, tag, regtype, regid, regno):
-    regN=f"{regtype}{regid}N"
-    if (regtype == "R"):
+    regN = f"{regtype}{regid}N"
+    if regtype == "R":
         f.write(f"    const int {regN} = insn->regno[{regno}];\n")
         f.write(f"    TCGv {regtype}{regid}V = get_result_gpr(ctx, {regN});\n")
-    elif (regtype == "C"):
+    elif regtype == "C":
         f.write(f"    const int {regN} = insn->regno[{regno}] + HEX_REG_SA0;\n")
         f.write(f"    TCGv {regtype}{regid}V = get_result_gpr(ctx, {regN});\n")
-    elif (regtype == "P"):
+    elif regtype == "P":
         f.write(f"    const int {regN} = insn->regno[{regno}];\n")
         f.write(f"    TCGv {regtype}{regid}V = tcg_temp_new();\n")
     else:
         print("Bad register parse: ", regtype, regid)
 
+
 def genptr_decl(f, tag, regtype, regid, regno):
-    regN=f"{regtype}{regid}N"
-    if (regtype == "R"):
-        if (regid in {"ss", "tt"}):
+    regN = f"{regtype}{regid}N"
+    if regtype == "R":
+        if regid in {"ss", "tt"}:
             f.write(f"    TCGv_i64 {regtype}{regid}V = tcg_temp_new_i64();\n")
             f.write(f"    const int {regN} = insn->regno[{regno}];\n")
-        elif (regid in {"dd", "ee", "xx", "yy"}):
+        elif regid in {"dd", "ee", "xx", "yy"}:
             genptr_decl_pair_writable(f, tag, regtype, regid, regno)
-        elif (regid in {"s", "t", "u", "v"}):
-            f.write(f"    TCGv {regtype}{regid}V = "
-                    f"hex_gpr[insn->regno[{regno}]];\n")
-        elif (regid in {"d", "e", "x", "y"}):
+        elif regid in {"s", "t", "u", "v"}:
+            f.write(
+                f"    TCGv {regtype}{regid}V = " f"hex_gpr[insn->regno[{regno}]];\n"
+            )
+        elif regid in {"d", "e", "x", "y"}:
             genptr_decl_writable(f, tag, regtype, regid, regno)
         else:
             print("Bad register parse: ", regtype, regid)
-    elif (regtype == "P"):
-        if (regid in {"s", "t", "u", "v"}):
-            f.write(f"    TCGv {regtype}{regid}V = "
-                    f"hex_pred[insn->regno[{regno}]];\n")
-        elif (regid in {"d", "e", "x"}):
+    elif regtype == "P":
+        if regid in {"s", "t", "u", "v"}:
+            f.write(
+                f"    TCGv {regtype}{regid}V = " f"hex_pred[insn->regno[{regno}]];\n"
+            )
+        elif regid in {"d", "e", "x"}:
             genptr_decl_writable(f, tag, regtype, regid, regno)
         else:
             print("Bad register parse: ", regtype, regid)
-    elif (regtype == "C"):
-        if (regid == "ss"):
-            f.write(f"    TCGv_i64 {regtype}{regid}V = "
-                    f"tcg_temp_new_i64();\n")
-            f.write(f"    const int {regN} = insn->regno[{regno}] + "
-                    "HEX_REG_SA0;\n")
-        elif (regid == "dd"):
+    elif regtype == "C":
+        if regid == "ss":
+            f.write(f"    TCGv_i64 {regtype}{regid}V = " f"tcg_temp_new_i64();\n")
+            f.write(f"    const int {regN} = insn->regno[{regno}] + " "HEX_REG_SA0;\n")
+        elif regid == "dd":
             genptr_decl_pair_writable(f, tag, regtype, regid, regno)
-        elif (regid == "s"):
+        elif regid == "s":
             f.write(f"    TCGv {regtype}{regid}V = tcg_temp_new();\n")
-            f.write(f"    const int {regtype}{regid}N = insn->regno[{regno}] + "
-                    "HEX_REG_SA0;\n")
-        elif (regid == "d"):
+            f.write(
+                f"    const int {regtype}{regid}N = insn->regno[{regno}] + "
+                "HEX_REG_SA0;\n"
+            )
+        elif regid == "d":
             genptr_decl_writable(f, tag, regtype, regid, regno)
         else:
             print("Bad register parse: ", regtype, regid)
-    elif (regtype == "M"):
-        if (regid == "u"):
-            f.write(f"    const int {regtype}{regid}N = "
-                    f"insn->regno[{regno}];\n")
-            f.write(f"    TCGv {regtype}{regid}V = hex_gpr[{regtype}{regid}N + "
-                    "HEX_REG_M0];\n")
+    elif regtype == "M":
+        if regid == "u":
+            f.write(f"    const int {regtype}{regid}N = " f"insn->regno[{regno}];\n")
+            f.write(
+                f"    TCGv {regtype}{regid}V = hex_gpr[{regtype}{regid}N + "
+                "HEX_REG_M0];\n"
+            )
         else:
             print("Bad register parse: ", regtype, regid)
-    elif (regtype == "V"):
-        if (regid in {"dd"}):
-            f.write(f"    const int {regtype}{regid}N = "
-                    f"insn->regno[{regno}];\n")
+    elif regtype == "V":
+        if regid in {"dd"}:
+            f.write(f"    const int {regtype}{regid}N = " f"insn->regno[{regno}];\n")
             f.write(f"    const intptr_t {regtype}{regid}V_off =\n")
-            if (hex_common.is_tmp_result(tag)):
-                f.write(f"        ctx_tmp_vreg_off(ctx, {regtype}{regid}N, 2, "
-                        "true);\n")
+            if hex_common.is_tmp_result(tag):
+                f.write(
+                    f"        ctx_tmp_vreg_off(ctx, {regtype}{regid}N, 2, " "true);\n"
+                )
             else:
                 f.write(f"        ctx_future_vreg_off(ctx, {regtype}{regid}N,")
                 f.write(" 2, true);\n")
-            if (not hex_common.skip_qemu_helper(tag)):
-                f.write(f"    TCGv_ptr {regtype}{regid}V = "
-                        "tcg_temp_new_ptr();\n")
-                f.write(f"    tcg_gen_addi_ptr({regtype}{regid}V, cpu_env, "
-                        f"{regtype}{regid}V_off);\n")
-        elif (regid in {"uu", "vv", "xx"}):
-            f.write(f"    const int {regtype}{regid}N = "
-                    f"insn->regno[{regno}];\n")
+            if not hex_common.skip_qemu_helper(tag):
+                f.write(f"    TCGv_ptr {regtype}{regid}V = " "tcg_temp_new_ptr();\n")
+                f.write(
+                    f"    tcg_gen_addi_ptr({regtype}{regid}V, cpu_env, "
+                    f"{regtype}{regid}V_off);\n"
+                )
+        elif regid in {"uu", "vv", "xx"}:
+            f.write(f"    const int {regtype}{regid}N = " f"insn->regno[{regno}];\n")
             f.write(f"    const intptr_t {regtype}{regid}V_off =\n")
             f.write(f"        offsetof(CPUHexagonState, {regtype}{regid}V);\n")
-            if (not hex_common.skip_qemu_helper(tag)):
-                f.write(f"    TCGv_ptr {regtype}{regid}V = "
-                        "tcg_temp_new_ptr();\n")
-                f.write(f"    tcg_gen_addi_ptr({regtype}{regid}V, cpu_env, "
-                        f"{regtype}{regid}V_off);\n")
-        elif (regid in {"s", "u", "v", "w"}):
-            f.write(f"    const int {regtype}{regid}N = "
-                    f"insn->regno[{regno}];\n")
+            if not hex_common.skip_qemu_helper(tag):
+                f.write(f"    TCGv_ptr {regtype}{regid}V = " "tcg_temp_new_ptr();\n")
+                f.write(
+                    f"    tcg_gen_addi_ptr({regtype}{regid}V, cpu_env, "
+                    f"{regtype}{regid}V_off);\n"
+                )
+        elif regid in {"s", "u", "v", "w"}:
+            f.write(f"    const int {regtype}{regid}N = " f"insn->regno[{regno}];\n")
             f.write(f"    const intptr_t {regtype}{regid}V_off =\n")
             f.write(f"        vreg_src_off(ctx, {regtype}{regid}N);\n")
-            if (not hex_common.skip_qemu_helper(tag)):
-                f.write(f"    TCGv_ptr {regtype}{regid}V = "
-                        "tcg_temp_new_ptr();\n")
-        elif (regid in {"d", "x", "y"}):
-            f.write(f"    const int {regtype}{regid}N = "
-                    f"insn->regno[{regno}];\n")
+            if not hex_common.skip_qemu_helper(tag):
+                f.write(f"    TCGv_ptr {regtype}{regid}V = " "tcg_temp_new_ptr();\n")
+        elif regid in {"d", "x", "y"}:
+            f.write(f"    const int {regtype}{regid}N = " f"insn->regno[{regno}];\n")
             f.write(f"    const intptr_t {regtype}{regid}V_off =\n")
-            if (regid == "y"):
+            if regid == "y":
                 f.write("        offsetof(CPUHexagonState, vtmp);\n")
-            elif (hex_common.is_tmp_result(tag)):
-                f.write(f"        ctx_tmp_vreg_off(ctx, {regtype}{regid}N, 1, "
-                        "true);\n")
+            elif hex_common.is_tmp_result(tag):
+                f.write(
+                    f"        ctx_tmp_vreg_off(ctx, {regtype}{regid}N, 1, " "true);\n"
+                )
             else:
                 f.write(f"        ctx_future_vreg_off(ctx, {regtype}{regid}N,")
-                f.write(" 1, true);\n");
+                f.write(" 1, true);\n")
 
-            if (not hex_common.skip_qemu_helper(tag)):
-                f.write(f"    TCGv_ptr {regtype}{regid}V = "
-                        "tcg_temp_new_ptr();\n")
-                f.write(f"    tcg_gen_addi_ptr({regtype}{regid}V, cpu_env, "
-                        f"{regtype}{regid}V_off);\n")
+            if not hex_common.skip_qemu_helper(tag):
+                f.write(f"    TCGv_ptr {regtype}{regid}V = " "tcg_temp_new_ptr();\n")
+                f.write(
+                    f"    tcg_gen_addi_ptr({regtype}{regid}V, cpu_env, "
+                    f"{regtype}{regid}V_off);\n"
+                )
         else:
             print("Bad register parse: ", regtype, regid)
-    elif (regtype == "Q"):
-        if (regid in {"d", "e", "x"}):
-            f.write(f"    const int {regtype}{regid}N = "
-                    f"insn->regno[{regno}];\n")
+    elif regtype == "Q":
+        if regid in {"d", "e", "x"}:
+            f.write(f"    const int {regtype}{regid}N = " f"insn->regno[{regno}];\n")
             f.write(f"    const intptr_t {regtype}{regid}V_off =\n")
             f.write(f"        get_result_qreg(ctx, {regtype}{regid}N);\n")
-            if (not hex_common.skip_qemu_helper(tag)):
-                f.write(f"    TCGv_ptr {regtype}{regid}V = "
-                        "tcg_temp_new_ptr();\n")
-                f.write(f"    tcg_gen_addi_ptr({regtype}{regid}V, cpu_env, "
-                        f"{regtype}{regid}V_off);\n")
-        elif (regid in {"s", "t", "u", "v"}):
-            f.write(f"    const int {regtype}{regid}N = "
-                    f"insn->regno[{regno}];\n")
+            if not hex_common.skip_qemu_helper(tag):
+                f.write(f"    TCGv_ptr {regtype}{regid}V = " "tcg_temp_new_ptr();\n")
+                f.write(
+                    f"    tcg_gen_addi_ptr({regtype}{regid}V, cpu_env, "
+                    f"{regtype}{regid}V_off);\n"
+                )
+        elif regid in {"s", "t", "u", "v"}:
+            f.write(f"    const int {regtype}{regid}N = " f"insn->regno[{regno}];\n")
             f.write(f"    const intptr_t {regtype}{regid}V_off =\n")
-            f.write(f"        offsetof(CPUHexagonState, "
-                    f"QRegs[{regtype}{regid}N]);\n")
-            if (not hex_common.skip_qemu_helper(tag)):
-                f.write(f"    TCGv_ptr {regtype}{regid}V = "
-                        "tcg_temp_new_ptr();\n")
+            f.write(
+                f"        offsetof(CPUHexagonState, " f"QRegs[{regtype}{regid}N]);\n"
+            )
+            if not hex_common.skip_qemu_helper(tag):
+                f.write(f"    TCGv_ptr {regtype}{regid}V = " "tcg_temp_new_ptr();\n")
         else:
             print("Bad register parse: ", regtype, regid)
     else:
         print("Bad register parse: ", regtype, regid)
 
+
 def genptr_decl_new(f, tag, regtype, regid, regno):
-    if (regtype == "N"):
-        if (regid in {"s", "t"}):
-            f.write(f"    TCGv {regtype}{regid}N = "
-                    f"hex_new_value[insn->regno[{regno}]];\n")
+    if regtype == "N":
+        if regid in {"s", "t"}:
+            f.write(
+                f"    TCGv {regtype}{regid}N = "
+                f"hex_new_value[insn->regno[{regno}]];\n"
+            )
         else:
             print("Bad register parse: ", regtype, regid)
-    elif (regtype == "P"):
-        if (regid in {"t", "u", "v"}):
-            f.write(f"    TCGv {regtype}{regid}N = "
-                    f"hex_new_pred_value[insn->regno[{regno}]];\n")
+    elif regtype == "P":
+        if regid in {"t", "u", "v"}:
+            f.write(
+                f"    TCGv {regtype}{regid}N = "
+                f"hex_new_pred_value[insn->regno[{regno}]];\n"
+            )
         else:
             print("Bad register parse: ", regtype, regid)
-    elif (regtype == "O"):
-        if (regid == "s"):
-            f.write(f"    const intptr_t {regtype}{regid}N_num = "
-                    f"insn->regno[{regno}];\n")
-            if (hex_common.skip_qemu_helper(tag)):
+    elif regtype == "O":
+        if regid == "s":
+            f.write(
+                f"    const intptr_t {regtype}{regid}N_num = "
+                f"insn->regno[{regno}];\n"
+            )
+            if hex_common.skip_qemu_helper(tag):
                 f.write(f"    const intptr_t {regtype}{regid}N_off =\n")
-                f.write("         ctx_future_vreg_off(ctx, "
-                        f"{regtype}{regid}N_num,")
+                f.write("         ctx_future_vreg_off(ctx, " f"{regtype}{regid}N_num,")
                 f.write(" 1, true);\n")
             else:
-                f.write(f"    TCGv {regtype}{regid}N = "
-                        f"tcg_constant_tl({regtype}{regid}N_num);\n")
+                f.write(
+                    f"    TCGv {regtype}{regid}N = "
+                    f"tcg_constant_tl({regtype}{regid}N_num);\n"
+                )
         else:
             print("Bad register parse: ", regtype, regid)
     else:
         print("Bad register parse: ", regtype, regid)
 
+
 def genptr_decl_opn(f, tag, regtype, regid, toss, numregs, i):
-    if (hex_common.is_pair(regid)):
+    if hex_common.is_pair(regid):
         genptr_decl(f, tag, regtype, regid, i)
-    elif (hex_common.is_single(regid)):
+    elif hex_common.is_single(regid):
         if hex_common.is_old_val(regtype, regid, tag):
-            genptr_decl(f,tag, regtype, regid, i)
+            genptr_decl(f, tag, regtype, regid, i)
         elif hex_common.is_new_val(regtype, regid, tag):
             genptr_decl_new(f, tag, regtype, regid, i)
         else:
-            print("Bad register parse: ",regtype,regid,toss,numregs)
+            print("Bad register parse: ", regtype, regid, toss, numregs)
     else:
-        print("Bad register parse: ",regtype,regid,toss,numregs)
+        print("Bad register parse: ", regtype, regid, toss, numregs)
+
 
-def genptr_decl_imm(f,immlett):
-    if (immlett.isupper()):
+def genptr_decl_imm(f, immlett):
+    if immlett.isupper():
         i = 1
     else:
         i = 0
     f.write(f"    int {hex_common.imm_name(immlett)} = insn->immed[{i}];\n")
 
+
 def genptr_src_read(f, tag, regtype, regid):
-    if (regtype == "R"):
-        if (regid in {"ss", "tt", "xx", "yy"}):
-            f.write(f"    tcg_gen_concat_i32_i64({regtype}{regid}V, "
-                    f"hex_gpr[{regtype}{regid}N],\n")
-            f.write(f"                                 hex_gpr[{regtype}"
-                    f"{regid}N + 1]);\n")
-        elif (regid in {"x", "y"}):
+    if regtype == "R":
+        if regid in {"ss", "tt", "xx", "yy"}:
+            f.write(
+                f"    tcg_gen_concat_i32_i64({regtype}{regid}V, "
+                f"hex_gpr[{regtype}{regid}N],\n"
+            )
+            f.write(
+                f"                                 hex_gpr[{regtype}"
+                f"{regid}N + 1]);\n"
+            )
+        elif regid in {"x", "y"}:
             ## For read/write registers, we need to get the original value into
             ## the result TCGv.  For conditional instructions, this is done in
             ## gen_start_packet.  For unconditional instructions, we do it here.
-            if ('A_CONDEXEC' not in hex_common.attribdict[tag]):
-                f.write(f"    tcg_gen_mov_tl({regtype}{regid}V, "
-                        f"hex_gpr[{regtype}{regid}N]);\n")
-        elif (regid not in {"s", "t", "u", "v"}):
+            if "A_CONDEXEC" not in hex_common.attribdict[tag]:
+                f.write(
+                    f"    tcg_gen_mov_tl({regtype}{regid}V, "
+                    f"hex_gpr[{regtype}{regid}N]);\n"
+                )
+        elif regid not in {"s", "t", "u", "v"}:
             print("Bad register parse: ", regtype, regid)
-    elif (regtype == "P"):
-        if (regid == "x"):
-            f.write(f"    tcg_gen_mov_tl({regtype}{regid}V, "
-                    f"hex_pred[{regtype}{regid}N]);\n")
-        elif (regid not in {"s", "t", "u", "v"}):
+    elif regtype == "P":
+        if regid == "x":
+            f.write(
+                f"    tcg_gen_mov_tl({regtype}{regid}V, "
+                f"hex_pred[{regtype}{regid}N]);\n"
+            )
+        elif regid not in {"s", "t", "u", "v"}:
             print("Bad register parse: ", regtype, regid)
-    elif (regtype == "C"):
-        if (regid == "ss"):
-            f.write(f"    gen_read_ctrl_reg_pair(ctx, {regtype}{regid}N, "
-                    f"{regtype}{regid}V);\n")
-        elif (regid == "s"):
-            f.write(f"    gen_read_ctrl_reg(ctx, {regtype}{regid}N, "
-                    f"{regtype}{regid}V);\n")
+    elif regtype == "C":
+        if regid == "ss":
+            f.write(
+                f"    gen_read_ctrl_reg_pair(ctx, {regtype}{regid}N, "
+                f"{regtype}{regid}V);\n"
+            )
+        elif regid == "s":
+            f.write(
+                f"    gen_read_ctrl_reg(ctx, {regtype}{regid}N, "
+                f"{regtype}{regid}V);\n"
+            )
         else:
             print("Bad register parse: ", regtype, regid)
-    elif (regtype == "M"):
-        if (regid != "u"):
+    elif regtype == "M":
+        if regid != "u":
             print("Bad register parse: ", regtype, regid)
-    elif (regtype == "V"):
-        if (regid in {"uu", "vv", "xx"}):
+    elif regtype == "V":
+        if regid in {"uu", "vv", "xx"}:
             f.write(f"    tcg_gen_gvec_mov(MO_64, {regtype}{regid}V_off,\n")
             f.write(f"        vreg_src_off(ctx, {regtype}{regid}N),\n")
             f.write("        sizeof(MMVector), sizeof(MMVector));\n")
@@ -272,147 +300,174 @@ def genptr_src_read(f, tag, regtype, regid):
             f.write(f"        {regtype}{regid}V_off + sizeof(MMVector),\n")
             f.write(f"        vreg_src_off(ctx, {regtype}{regid}N ^ 1),\n")
             f.write("        sizeof(MMVector), sizeof(MMVector));\n")
-        elif (regid in {"s", "u", "v", "w"}):
-            if (not hex_common.skip_qemu_helper(tag)):
-                f.write(f"    tcg_gen_addi_ptr({regtype}{regid}V, cpu_env, "
-                        f"{regtype}{regid}V_off);\n")
-        elif (regid in {"x", "y"}):
+        elif regid in {"s", "u", "v", "w"}:
+            if not hex_common.skip_qemu_helper(tag):
+                f.write(
+                    f"    tcg_gen_addi_ptr({regtype}{regid}V, cpu_env, "
+                    f"{regtype}{regid}V_off);\n"
+                )
+        elif regid in {"x", "y"}:
             f.write(f"    tcg_gen_gvec_mov(MO_64, {regtype}{regid}V_off,\n")
             f.write(f"        vreg_src_off(ctx, {regtype}{regid}N),\n")
             f.write("        sizeof(MMVector), sizeof(MMVector));\n")
         else:
             print("Bad register parse: ", regtype, regid)
-    elif (regtype == "Q"):
-        if (regid in {"s", "t", "u", "v"}):
-            if (not hex_common.skip_qemu_helper(tag)):
-                f.write(f"    tcg_gen_addi_ptr({regtype}{regid}V, cpu_env, "
-                        f"{regtype}{regid}V_off);\n")
-        elif (regid in {"x"}):
+    elif regtype == "Q":
+        if regid in {"s", "t", "u", "v"}:
+            if not hex_common.skip_qemu_helper(tag):
+                f.write(
+                    f"    tcg_gen_addi_ptr({regtype}{regid}V, cpu_env, "
+                    f"{regtype}{regid}V_off);\n"
+                )
+        elif regid in {"x"}:
             f.write(f"    tcg_gen_gvec_mov(MO_64, {regtype}{regid}V_off,\n")
-            f.write(f"        offsetof(CPUHexagonState, "
-                    f"QRegs[{regtype}{regid}N]),\n")
+            f.write(
+                f"        offsetof(CPUHexagonState, " f"QRegs[{regtype}{regid}N]),\n"
+            )
             f.write("        sizeof(MMQReg), sizeof(MMQReg));\n")
         else:
             print("Bad register parse: ", regtype, regid)
     else:
         print("Bad register parse: ", regtype, regid)
 
-def genptr_src_read_new(f,regtype,regid):
-    if (regtype == "N"):
-        if (regid not in {"s", "t"}):
+
+def genptr_src_read_new(f, regtype, regid):
+    if regtype == "N":
+        if regid not in {"s", "t"}:
             print("Bad register parse: ", regtype, regid)
-    elif (regtype == "P"):
-        if (regid not in {"t", "u", "v"}):
+    elif regtype == "P":
+        if regid not in {"t", "u", "v"}:
             print("Bad register parse: ", regtype, regid)
-    elif (regtype == "O"):
-        if (regid != "s"):
+    elif regtype == "O":
+        if regid != "s":
             print("Bad register parse: ", regtype, regid)
     else:
         print("Bad register parse: ", regtype, regid)
 
-def genptr_src_read_opn(f,regtype,regid,tag):
-    if (hex_common.is_pair(regid)):
+
+def genptr_src_read_opn(f, regtype, regid, tag):
+    if hex_common.is_pair(regid):
         genptr_src_read(f, tag, regtype, regid)
-    elif (hex_common.is_single(regid)):
+    elif hex_common.is_single(regid):
         if hex_common.is_old_val(regtype, regid, tag):
             genptr_src_read(f, tag, regtype, regid)
         elif hex_common.is_new_val(regtype, regid, tag):
-            genptr_src_read_new(f,regtype,regid)
+            genptr_src_read_new(f, regtype, regid)
         else:
-            print("Bad register parse: ",regtype,regid,toss,numregs)
+            print("Bad register parse: ", regtype, regid, toss, numregs)
     else:
-        print("Bad register parse: ",regtype,regid,toss,numregs)
+        print("Bad register parse: ", regtype, regid, toss, numregs)
+
 
 def gen_helper_call_opn(f, tag, regtype, regid, toss, numregs, i):
-    if (i > 0): f.write(", ")
-    if (hex_common.is_pair(regid)):
+    if i > 0:
+        f.write(", ")
+    if hex_common.is_pair(regid):
         f.write(f"{regtype}{regid}V")
-    elif (hex_common.is_single(regid)):
+    elif hex_common.is_single(regid):
         if hex_common.is_old_val(regtype, regid, tag):
             f.write(f"{regtype}{regid}V")
         elif hex_common.is_new_val(regtype, regid, tag):
             f.write(f"{regtype}{regid}N")
         else:
-            print("Bad register parse: ",regtype,regid,toss,numregs)
+            print("Bad register parse: ", regtype, regid, toss, numregs)
     else:
-        print("Bad register parse: ",regtype,regid,toss,numregs)
+        print("Bad register parse: ", regtype, regid, toss, numregs)
 
-def gen_helper_decl_imm(f,immlett):
-    f.write(f"    TCGv tcgv_{hex_common.imm_name(immlett)} = "
-            f"tcg_constant_tl({hex_common.imm_name(immlett)});\n")
 
-def gen_helper_call_imm(f,immlett):
+def gen_helper_decl_imm(f, immlett):
+    f.write(
+        f"    TCGv tcgv_{hex_common.imm_name(immlett)} = "
+        f"tcg_constant_tl({hex_common.imm_name(immlett)});\n"
+    )
+
+
+def gen_helper_call_imm(f, immlett):
     f.write(f", tcgv_{hex_common.imm_name(immlett)}")
 
+
 def genptr_dst_write_pair(f, tag, regtype, regid):
-    f.write(f"    gen_log_reg_write_pair({regtype}{regid}N, "
-            f"{regtype}{regid}V);\n")
+    f.write(f"    gen_log_reg_write_pair({regtype}{regid}N, " f"{regtype}{regid}V);\n")
+
 
 def genptr_dst_write(f, tag, regtype, regid):
-    if (regtype == "R"):
-        if (regid in {"dd", "xx", "yy"}):
+    if regtype == "R":
+        if regid in {"dd", "xx", "yy"}:
             genptr_dst_write_pair(f, tag, regtype, regid)
-        elif (regid in {"d", "e", "x", "y"}):
-            f.write(f"    gen_log_reg_write({regtype}{regid}N, "
-                    f"{regtype}{regid}V);\n")
+        elif regid in {"d", "e", "x", "y"}:
+            f.write(
+                f"    gen_log_reg_write({regtype}{regid}N, " f"{regtype}{regid}V);\n"
+            )
         else:
             print("Bad register parse: ", regtype, regid)
-    elif (regtype == "P"):
-        if (regid in {"d", "e", "x"}):
-            f.write(f"    gen_log_pred_write(ctx, {regtype}{regid}N, "
-                    f"{regtype}{regid}V);\n")
+    elif regtype == "P":
+        if regid in {"d", "e", "x"}:
+            f.write(
+                f"    gen_log_pred_write(ctx, {regtype}{regid}N, "
+                f"{regtype}{regid}V);\n"
+            )
         else:
             print("Bad register parse: ", regtype, regid)
-    elif (regtype == "C"):
-        if (regid == "dd"):
-            f.write(f"    gen_write_ctrl_reg_pair(ctx, {regtype}{regid}N, "
-                    f"{regtype}{regid}V);\n")
-        elif (regid == "d"):
-            f.write(f"    gen_write_ctrl_reg(ctx, {regtype}{regid}N, "
-                    f"{regtype}{regid}V);\n")
+    elif regtype == "C":
+        if regid == "dd":
+            f.write(
+                f"    gen_write_ctrl_reg_pair(ctx, {regtype}{regid}N, "
+                f"{regtype}{regid}V);\n"
+            )
+        elif regid == "d":
+            f.write(
+                f"    gen_write_ctrl_reg(ctx, {regtype}{regid}N, "
+                f"{regtype}{regid}V);\n"
+            )
         else:
             print("Bad register parse: ", regtype, regid)
     else:
         print("Bad register parse: ", regtype, regid)
 
+
 def genptr_dst_write_ext(f, tag, regtype, regid, newv="EXT_DFL"):
-    if (regtype == "V"):
-        if (regid in {"xx"}):
-            f.write(f"    gen_log_vreg_write_pair(ctx, {regtype}{regid}V_off, "
-                    f"{regtype}{regid}N, {newv});\n")
-        elif (regid in {"y"}):
-            f.write(f"    gen_log_vreg_write(ctx, {regtype}{regid}V_off, "
-                    f"{regtype}{regid}N, {newv});\n")
-        elif (regid not in {"dd", "d", "x"}):
+    if regtype == "V":
+        if regid in {"xx"}:
+            f.write(
+                f"    gen_log_vreg_write_pair(ctx, {regtype}{regid}V_off, "
+                f"{regtype}{regid}N, {newv});\n"
+            )
+        elif regid in {"y"}:
+            f.write(
+                f"    gen_log_vreg_write(ctx, {regtype}{regid}V_off, "
+                f"{regtype}{regid}N, {newv});\n"
+            )
+        elif regid not in {"dd", "d", "x"}:
             print("Bad register parse: ", regtype, regid)
-    elif (regtype == "Q"):
-        if (regid not in {"d", "e", "x"}):
-
+    elif regtype == "Q":
+        if regid not in {"d", "e", "x"}:
             print("Bad register parse: ", regtype, regid)
     else:
         print("Bad register parse: ", regtype, regid)
 
-def genptr_dst_write_opn(f,regtype, regid, tag):
-    if (hex_common.is_pair(regid)):
-        if (hex_common.is_hvx_reg(regtype)):
-            if (hex_common.is_tmp_result(tag)):
+
+def genptr_dst_write_opn(f, regtype, regid, tag):
+    if hex_common.is_pair(regid):
+        if hex_common.is_hvx_reg(regtype):
+            if hex_common.is_tmp_result(tag):
                 genptr_dst_write_ext(f, tag, regtype, regid, "EXT_TMP")
             else:
                 genptr_dst_write_ext(f, tag, regtype, regid)
         else:
             genptr_dst_write(f, tag, regtype, regid)
-    elif (hex_common.is_single(regid)):
-        if (hex_common.is_hvx_reg(regtype)):
-            if (hex_common.is_new_result(tag)):
+    elif hex_common.is_single(regid):
+        if hex_common.is_hvx_reg(regtype):
+            if hex_common.is_new_result(tag):
                 genptr_dst_write_ext(f, tag, regtype, regid, "EXT_NEW")
-            elif (hex_common.is_tmp_result(tag)):
+            elif hex_common.is_tmp_result(tag):
                 genptr_dst_write_ext(f, tag, regtype, regid, "EXT_TMP")
             else:
                 genptr_dst_write_ext(f, tag, regtype, regid, "EXT_DFL")
         else:
             genptr_dst_write(f, tag, regtype, regid)
     else:
-        print("Bad register parse: ",regtype,regid,toss,numregs)
+        print("Bad register parse: ", regtype, regid, toss, numregs)
+
 
 ##
 ## Generate the TCG code to call the helper
@@ -437,57 +492,59 @@ def genptr_dst_write_opn(f,regtype, regid, tag):
 ##
 def gen_tcg_func(f, tag, regs, imms):
     f.write(f"static void generate_{tag}(DisasContext *ctx)\n")
-    f.write('{\n')
+    f.write("{\n")
 
     f.write("    Insn *insn __attribute__((unused)) = ctx->insn;\n")
 
-    if hex_common.need_ea(tag): gen_decl_ea_tcg(f, tag)
-    i=0
+    if hex_common.need_ea(tag):
+        gen_decl_ea_tcg(f, tag)
+    i = 0
     ## Declare all the operands (regs and immediates)
-    for regtype,regid,toss,numregs in regs:
+    for regtype, regid, toss, numregs in regs:
         genptr_decl_opn(f, tag, regtype, regid, toss, numregs, i)
         i += 1
-    for immlett,bits,immshift in imms:
-        genptr_decl_imm(f,immlett)
+    for immlett, bits, immshift in imms:
+        genptr_decl_imm(f, immlett)
 
-    if 'A_PRIV' in hex_common.attribdict[tag]:
-        f.write('    fCHECKFORPRIV();\n')
-    if 'A_GUEST' in hex_common.attribdict[tag]:
-        f.write('    fCHECKFORGUEST();\n')
+    if "A_PRIV" in hex_common.attribdict[tag]:
+        f.write("    fCHECKFORPRIV();\n")
+    if "A_GUEST" in hex_common.attribdict[tag]:
+        f.write("    fCHECKFORGUEST();\n")
 
     ## Read all the inputs
-    for regtype,regid,toss,numregs in regs:
-        if (hex_common.is_read(regid)):
-            genptr_src_read_opn(f,regtype,regid,tag)
+    for regtype, regid, toss, numregs in regs:
+        if hex_common.is_read(regid):
+            genptr_src_read_opn(f, regtype, regid, tag)
 
     if hex_common.is_idef_parser_enabled(tag):
         declared = []
         ## Handle registers
-        for regtype,regid,toss,numregs in regs:
-            if (hex_common.is_pair(regid)
-                or (hex_common.is_single(regid)
-                    and hex_common.is_old_val(regtype, regid, tag))):
+        for regtype, regid, toss, numregs in regs:
+            if hex_common.is_pair(regid) or (
+                hex_common.is_single(regid)
+                and hex_common.is_old_val(regtype, regid, tag)
+            ):
                 declared.append(f"{regtype}{regid}V")
                 if regtype == "M":
                     declared.append(f"{regtype}{regid}N")
             elif hex_common.is_new_val(regtype, regid, tag):
                 declared.append(f"{regtype}{regid}N")
             else:
-                print("Bad register parse: ",regtype,regid,toss,numregs)
+                print("Bad register parse: ", regtype, regid, toss, numregs)
 
         ## Handle immediates
-        for immlett,bits,immshift in imms:
+        for immlett, bits, immshift in imms:
             declared.append(hex_common.imm_name(immlett))
 
         arguments = ", ".join(["ctx", "ctx->insn", "ctx->pkt"] + declared)
         f.write(f"    emit_{tag}({arguments});\n")
 
-    elif ( hex_common.skip_qemu_helper(tag) ):
+    elif hex_common.skip_qemu_helper(tag):
         f.write(f"    fGEN_TCG_{tag}({hex_common.semdict[tag]});\n")
     else:
         ## Generate the call to the helper
-        for immlett,bits,immshift in imms:
-            gen_helper_decl_imm(f,immlett)
+        for immlett, bits, immshift in imms:
+            gen_helper_decl_imm(f, immlett)
         if hex_common.need_pkt_has_multi_cof(tag):
             f.write("    TCGv pkt_has_multi_cof = ")
             f.write("tcg_constant_tl(ctx->pkt->pkt_has_multi_cof);\n")
@@ -500,62 +557,68 @@ def gen_tcg_func(f, tag, regs, imms):
         if hex_common.helper_needs_next_PC(tag):
             f.write("    TCGv next_PC = tcg_constant_tl(ctx->next_PC);\n")
         f.write(f"    gen_helper_{tag}(")
-        i=0
+        i = 0
         ## If there is a scalar result, it is the return type
-        for regtype,regid,toss,numregs in regs:
-            if (hex_common.is_written(regid)):
-                if (hex_common.is_hvx_reg(regtype)):
+        for regtype, regid, toss, numregs in regs:
+            if hex_common.is_written(regid):
+                if hex_common.is_hvx_reg(regtype):
                     continue
                 gen_helper_call_opn(f, tag, regtype, regid, toss, numregs, i)
                 i += 1
-        if (i > 0): f.write(", ")
+        if i > 0:
+            f.write(", ")
         f.write("cpu_env")
-        i=1
+        i = 1
         ## For conditional instructions, we pass in the destination register
-        if 'A_CONDEXEC' in hex_common.attribdict[tag]:
+        if "A_CONDEXEC" in hex_common.attribdict[tag]:
             for regtype, regid, toss, numregs in regs:
-                if (hex_common.is_writeonly(regid) and
-                    not hex_common.is_hvx_reg(regtype)):
-                    gen_helper_call_opn(f, tag, regtype, regid, toss, \
-                                        numregs, i)
+                if hex_common.is_writeonly(regid) and not hex_common.is_hvx_reg(
+                    regtype
+                ):
+                    gen_helper_call_opn(f, tag, regtype, regid, toss, numregs, i)
                     i += 1
-        for regtype,regid,toss,numregs in regs:
-            if (hex_common.is_written(regid)):
-                if (not hex_common.is_hvx_reg(regtype)):
+        for regtype, regid, toss, numregs in regs:
+            if hex_common.is_written(regid):
+                if not hex_common.is_hvx_reg(regtype):
                     continue
                 gen_helper_call_opn(f, tag, regtype, regid, toss, numregs, i)
                 i += 1
-        for regtype,regid,toss,numregs in regs:
-            if (hex_common.is_read(regid)):
-                if (hex_common.is_hvx_reg(regtype) and
-                    hex_common.is_readwrite(regid)):
+        for regtype, regid, toss, numregs in regs:
+            if hex_common.is_read(regid):
+                if hex_common.is_hvx_reg(regtype) and hex_common.is_readwrite(regid):
                     continue
                 gen_helper_call_opn(f, tag, regtype, regid, toss, numregs, i)
                 i += 1
-        for immlett,bits,immshift in imms:
-            gen_helper_call_imm(f,immlett)
+        for immlett, bits, immshift in imms:
+            gen_helper_call_imm(f, immlett)
 
         if hex_common.need_pkt_has_multi_cof(tag):
             f.write(", pkt_has_multi_cof")
-        if hex_common.need_PC(tag): f.write(", PC")
-        if hex_common.helper_needs_next_PC(tag): f.write(", next_PC")
-        if hex_common.need_slot(tag): f.write(", slot")
-        if hex_common.need_part1(tag): f.write(", part1" )
+        if hex_common.need_PC(tag):
+            f.write(", PC")
+        if hex_common.helper_needs_next_PC(tag):
+            f.write(", next_PC")
+        if hex_common.need_slot(tag):
+            f.write(", slot")
+        if hex_common.need_part1(tag):
+            f.write(", part1")
         f.write(");\n")
 
     ## Write all the outputs
-    for regtype,regid,toss,numregs in regs:
-        if (hex_common.is_written(regid)):
-            genptr_dst_write_opn(f,regtype, regid, tag)
+    for regtype, regid, toss, numregs in regs:
+        if hex_common.is_written(regid):
+            genptr_dst_write_opn(f, regtype, regid, tag)
 
     f.write("}\n\n")
 
+
 def gen_def_tcg_func(f, tag, tagregs, tagimms):
     regs = tagregs[tag]
     imms = tagimms[tag]
 
     gen_tcg_func(f, tag, regs, imms)
 
+
 def main():
     hex_common.read_semantics_file(sys.argv[1])
     hex_common.read_attribs_file(sys.argv[2])
@@ -578,30 +641,31 @@ def main():
     tagimms = hex_common.get_tagimms()
 
     output_file = sys.argv[-1]
-    with open(output_file, 'w') as f:
+    with open(output_file, "w") as f:
         f.write("#ifndef HEXAGON_TCG_FUNCS_H\n")
         f.write("#define HEXAGON_TCG_FUNCS_H\n\n")
         if is_idef_parser_enabled:
-            f.write("#include \"idef-generated-emitter.h.inc\"\n\n")
+            f.write('#include "idef-generated-emitter.h.inc"\n\n')
 
         for tag in hex_common.tags:
             ## Skip the priv instructions
-            if ( "A_PRIV" in hex_common.attribdict[tag] ) :
+            if "A_PRIV" in hex_common.attribdict[tag]:
                 continue
             ## Skip the guest instructions
-            if ( "A_GUEST" in hex_common.attribdict[tag] ) :
+            if "A_GUEST" in hex_common.attribdict[tag]:
                 continue
             ## Skip the diag instructions
-            if ( tag == "Y6_diag" ) :
+            if tag == "Y6_diag":
                 continue
-            if ( tag == "Y6_diag0" ) :
+            if tag == "Y6_diag0":
                 continue
-            if ( tag == "Y6_diag1" ) :
+            if tag == "Y6_diag1":
                 continue
 
             gen_def_tcg_func(f, tag, tagregs, tagimms)
 
         f.write("#endif    /* HEXAGON_TCG_FUNCS_H */\n")
 
+
 if __name__ == "__main__":
     main()
diff --git a/target/hexagon/hex_common.py b/target/hexagon/hex_common.py
index 9f9da81e20..40f28ca933 100755
--- a/target/hexagon/hex_common.py
+++ b/target/hexagon/hex_common.py
@@ -21,14 +21,15 @@
 import re
 import string
 
-behdict = {}          # tag ->behavior
-semdict = {}          # tag -> semantics
-attribdict = {}       # tag -> attributes
-macros = {}           # macro -> macro information...
-attribinfo = {}       # Register information and misc
-tags = []             # list of all tags
-overrides = {}        # tags with helper overrides
-idef_parser_enabled = {} # tags enabled for idef-parser
+behdict = {}  # tag ->behavior
+semdict = {}  # tag -> semantics
+attribdict = {}  # tag -> attributes
+macros = {}  # macro -> macro information...
+attribinfo = {}  # Register information and misc
+tags = []  # list of all tags
+overrides = {}  # tags with helper overrides
+idef_parser_enabled = {}  # tags enabled for idef-parser
+
 
 # We should do this as a hash for performance,
 # but to keep order let's keep it as a list.
@@ -37,71 +38,77 @@ def uniquify(seq):
     seen_add = seen.add
     return [x for x in seq if x not in seen and not seen_add(x)]
 
-regre = re.compile(
-    r"((?<!DUP)[MNORCPQXSGVZA])([stuvwxyzdefg]+)([.]?[LlHh]?)(\d+S?)")
+
+regre = re.compile(r"((?<!DUP)[MNORCPQXSGVZA])([stuvwxyzdefg]+)([.]?[LlHh]?)(\d+S?)")
 immre = re.compile(r"[#]([rRsSuUm])(\d+)(?:[:](\d+))?")
-reg_or_immre = \
-    re.compile(r"(((?<!DUP)[MNRCOPQXSGVZA])([stuvwxyzdefg]+)" + \
-                "([.]?[LlHh]?)(\d+S?))|([#]([rRsSuUm])(\d+)[:]?(\d+)?)")
+reg_or_immre = re.compile(
+    r"(((?<!DUP)[MNRCOPQXSGVZA])([stuvwxyzdefg]+)"
+    + "([.]?[LlHh]?)(\d+S?))|([#]([rRsSuUm])(\d+)[:]?(\d+)?)"
+)
 relimmre = re.compile(r"[#]([rR])(\d+)(?:[:](\d+))?")
 absimmre = re.compile(r"[#]([sSuUm])(\d+)(?:[:](\d+))?")
 
 finished_macros = set()
 
-def expand_macro_attribs(macro,allmac_re):
+
+def expand_macro_attribs(macro, allmac_re):
     if macro.key not in finished_macros:
         # Get a list of all things that might be macros
         l = allmac_re.findall(macro.beh)
         for submacro in l:
-            if not submacro: continue
+            if not submacro:
+                continue
             if not macros[submacro]:
                 raise Exception(f"Couldn't find macro: <{l}>")
-            macro.attribs |= expand_macro_attribs(
-                macros[submacro], allmac_re)
+            macro.attribs |= expand_macro_attribs(macros[submacro], allmac_re)
             finished_macros.add(macro.key)
     return macro.attribs
 
+
 # When qemu needs an attribute that isn't in the imported files,
 # we'll add it here.
 def add_qemu_macro_attrib(name, attrib):
     macros[name].attribs.add(attrib)
 
-immextre = re.compile(r'f(MUST_)?IMMEXT[(]([UuSsRr])')
+
+immextre = re.compile(r"f(MUST_)?IMMEXT[(]([UuSsRr])")
+
 
 def is_cond_jump(tag):
-    if tag == 'J2_rte':
+    if tag == "J2_rte":
         return False
-    if ('A_HWLOOP0_END' in attribdict[tag] or
-        'A_HWLOOP1_END' in attribdict[tag]):
+    if "A_HWLOOP0_END" in attribdict[tag] or "A_HWLOOP1_END" in attribdict[tag]:
         return False
-    return \
-        re.compile(r"(if.*fBRANCH)|(if.*fJUMPR)").search(semdict[tag]) != None
+    return re.compile(r"(if.*fBRANCH)|(if.*fJUMPR)").search(semdict[tag]) != None
+
 
 def is_cond_call(tag):
     return re.compile(r"(if.*fCALL)").search(semdict[tag]) != None
 
+
 def calculate_attribs():
-    add_qemu_macro_attrib('fREAD_PC', 'A_IMPLICIT_READS_PC')
-    add_qemu_macro_attrib('fTRAP', 'A_IMPLICIT_READS_PC')
-    add_qemu_macro_attrib('fWRITE_P0', 'A_WRITES_PRED_REG')
-    add_qemu_macro_attrib('fWRITE_P1', 'A_WRITES_PRED_REG')
-    add_qemu_macro_attrib('fWRITE_P2', 'A_WRITES_PRED_REG')
-    add_qemu_macro_attrib('fWRITE_P3', 'A_WRITES_PRED_REG')
-    add_qemu_macro_attrib('fSET_OVERFLOW', 'A_IMPLICIT_WRITES_USR')
-    add_qemu_macro_attrib('fSET_LPCFG', 'A_IMPLICIT_WRITES_USR')
-    add_qemu_macro_attrib('fLOAD', 'A_SCALAR_LOAD')
-    add_qemu_macro_attrib('fSTORE', 'A_SCALAR_STORE')
+    add_qemu_macro_attrib("fREAD_PC", "A_IMPLICIT_READS_PC")
+    add_qemu_macro_attrib("fTRAP", "A_IMPLICIT_READS_PC")
+    add_qemu_macro_attrib("fWRITE_P0", "A_WRITES_PRED_REG")
+    add_qemu_macro_attrib("fWRITE_P1", "A_WRITES_PRED_REG")
+    add_qemu_macro_attrib("fWRITE_P2", "A_WRITES_PRED_REG")
+    add_qemu_macro_attrib("fWRITE_P3", "A_WRITES_PRED_REG")
+    add_qemu_macro_attrib("fSET_OVERFLOW", "A_IMPLICIT_WRITES_USR")
+    add_qemu_macro_attrib("fSET_LPCFG", "A_IMPLICIT_WRITES_USR")
+    add_qemu_macro_attrib("fLOAD", "A_SCALAR_LOAD")
+    add_qemu_macro_attrib("fSTORE", "A_SCALAR_STORE")
 
     # Recurse down macros, find attributes from sub-macros
     macroValues = list(macros.values())
-    allmacros_restr = "|".join(set([ m.re.pattern for m in macroValues ]))
+    allmacros_restr = "|".join(set([m.re.pattern for m in macroValues]))
     allmacros_re = re.compile(allmacros_restr)
     for macro in macroValues:
-        expand_macro_attribs(macro,allmacros_re)
+        expand_macro_attribs(macro, allmacros_re)
     # Append attributes to all instructions
     for tag in tags:
         for macname in allmacros_re.findall(semdict[tag]):
-            if not macname: continue
+            if not macname:
+                continue
             macro = macros[macname]
             attribdict[tag] |= set(macro.attribs)
     # Figure out which instructions write predicate registers
@@ -110,31 +117,34 @@ def calculate_attribs():
         regs = tagregs[tag]
         for regtype, regid, toss, numregs in regs:
             if regtype == "P" and is_written(regid):
-                attribdict[tag].add('A_WRITES_PRED_REG')
+                attribdict[tag].add("A_WRITES_PRED_REG")
     # Mark conditional jumps and calls
     #     Not all instructions are properly marked with A_CONDEXEC
     for tag in tags:
         if is_cond_jump(tag) or is_cond_call(tag):
-            attribdict[tag].add('A_CONDEXEC')
+            attribdict[tag].add("A_CONDEXEC")
+
 
 def SEMANTICS(tag, beh, sem):
-    #print tag,beh,sem
+    # print tag,beh,sem
     behdict[tag] = beh
     semdict[tag] = sem
     attribdict[tag] = set()
-    tags.append(tag)        # dicts have no order, this is for order
+    tags.append(tag)  # dicts have no order, this is for order
+
 
 def ATTRIBUTES(tag, attribstring):
-    attribstring = \
-        attribstring.replace("ATTRIBS","").replace("(","").replace(")","")
+    attribstring = attribstring.replace("ATTRIBS", "").replace("(", "").replace(")", "")
     if not attribstring:
         return
     attribs = attribstring.split(",")
     for attrib in attribs:
         attribdict[tag].add(attrib.strip())
 
+
 class Macro(object):
-    __slots__ = ['key','name', 'beh', 'attribs', 're']
+    __slots__ = ["key", "name", "beh", "attribs", "re"]
+
     def __init__(self, name, beh, attribs):
         self.key = name
         self.name = name
@@ -142,20 +152,24 @@ def __init__(self, name, beh, attribs):
         self.attribs = set(attribs)
         self.re = re.compile("\\b" + name + "\\b")
 
-def MACROATTRIB(macname,beh,attribstring):
-    attribstring = attribstring.replace("(","").replace(")","")
+
+def MACROATTRIB(macname, beh, attribstring):
+    attribstring = attribstring.replace("(", "").replace(")", "")
     if attribstring:
         attribs = attribstring.split(",")
     else:
         attribs = []
-    macros[macname] = Macro(macname,beh,attribs)
+    macros[macname] = Macro(macname, beh, attribs)
+
 
 def compute_tag_regs(tag):
     return uniquify(regre.findall(behdict[tag]))
 
+
 def compute_tag_immediates(tag):
     return uniquify(immre.findall(behdict[tag]))
 
+
 ##
 ##  tagregs is the main data structure we'll use
 ##  tagregs[tag] will contain the registers used by an instruction
@@ -180,89 +194,113 @@ def compute_tag_immediates(tag):
 def get_tagregs():
     return dict(zip(tags, list(map(compute_tag_regs, tags))))
 
+
 def get_tagimms():
     return dict(zip(tags, list(map(compute_tag_immediates, tags))))
 
+
 def is_pair(regid):
     return len(regid) == 2
 
+
 def is_single(regid):
     return len(regid) == 1
 
+
 def is_written(regid):
     return regid[0] in "dexy"
 
+
 def is_writeonly(regid):
     return regid[0] in "de"
 
+
 def is_read(regid):
     return regid[0] in "stuvwxy"
 
+
 def is_readwrite(regid):
     return regid[0] in "xy"
 
+
 def is_scalar_reg(regtype):
     return regtype in "RPC"
 
+
 def is_hvx_reg(regtype):
     return regtype in "VQ"
 
+
 def is_old_val(regtype, regid, tag):
-    return regtype+regid+'V' in semdict[tag]
+    return regtype + regid + "V" in semdict[tag]
+
 
 def is_new_val(regtype, regid, tag):
-    return regtype+regid+'N' in semdict[tag]
+    return regtype + regid + "N" in semdict[tag]
+
 
 def need_slot(tag):
-    if (('A_CONDEXEC' in attribdict[tag] and
-         'A_JUMP' not in attribdict[tag]) or
-        'A_STORE' in attribdict[tag] or
-        'A_LOAD' in attribdict[tag]):
+    if (
+        ("A_CONDEXEC" in attribdict[tag] and "A_JUMP" not in attribdict[tag])
+        or "A_STORE" in attribdict[tag]
+        or "A_LOAD" in attribdict[tag]
+    ):
         return 1
     else:
         return 0
 
+
 def need_part1(tag):
     return re.compile(r"fPART1").search(semdict[tag])
 
+
 def need_ea(tag):
     return re.compile(r"\bEA\b").search(semdict[tag])
 
+
 def need_PC(tag):
-    return 'A_IMPLICIT_READS_PC' in attribdict[tag]
+    return "A_IMPLICIT_READS_PC" in attribdict[tag]
+
 
 def helper_needs_next_PC(tag):
-    return 'A_CALL' in attribdict[tag]
+    return "A_CALL" in attribdict[tag]
+
 
 def need_pkt_has_multi_cof(tag):
-    return 'A_COF' in attribdict[tag]
+    return "A_COF" in attribdict[tag]
+
 
 def need_condexec_reg(tag, regs):
-    if 'A_CONDEXEC' in attribdict[tag]:
+    if "A_CONDEXEC" in attribdict[tag]:
         for regtype, regid, toss, numregs in regs:
             if is_writeonly(regid) and not is_hvx_reg(regtype):
                 return True
     return False
 
+
 def skip_qemu_helper(tag):
     return tag in overrides.keys()
 
+
 def is_tmp_result(tag):
-    return ('A_CVI_TMP' in attribdict[tag] or
-            'A_CVI_TMP_DST' in attribdict[tag])
+    return "A_CVI_TMP" in attribdict[tag] or "A_CVI_TMP_DST" in attribdict[tag]
+
 
 def is_new_result(tag):
-    return ('A_CVI_NEW' in attribdict[tag])
+    return "A_CVI_NEW" in attribdict[tag]
+
 
 def is_idef_parser_enabled(tag):
     return tag in idef_parser_enabled
 
+
 def imm_name(immlett):
     return f"{immlett}iV"
 
+
 def read_semantics_file(name):
     eval_line = ""
-    for line in open(name, 'rt').readlines():
+    for line in open(name, "rt").readlines():
         if not line.startswith("#"):
             eval_line += line
             if line.endswith("\\\n"):
@@ -271,24 +309,29 @@ def read_semantics_file(name):
                 eval(eval_line.strip())
                 eval_line = ""
 
+
 def read_attribs_file(name):
-    attribre = re.compile(r'DEF_ATTRIB\(([A-Za-z0-9_]+), ([^,]*), ' +
-            r'"([A-Za-z0-9_\.]*)", "([A-Za-z0-9_\.]*)"\)')
-    for line in open(name, 'rt').readlines():
+    attribre = re.compile(
+        r"DEF_ATTRIB\(([A-Za-z0-9_]+), ([^,]*), "
+        + r'"([A-Za-z0-9_\.]*)", "([A-Za-z0-9_\.]*)"\)'
+    )
+    for line in open(name, "rt").readlines():
         if not attribre.match(line):
             continue
-        (attrib_base,descr,rreg,wreg) = attribre.findall(line)[0]
-        attrib_base = 'A_' + attrib_base
-        attribinfo[attrib_base] = {'rreg':rreg, 'wreg':wreg, 'descr':descr}
+        (attrib_base, descr, rreg, wreg) = attribre.findall(line)[0]
+        attrib_base = "A_" + attrib_base
+        attribinfo[attrib_base] = {"rreg": rreg, "wreg": wreg, "descr": descr}
+
 
 def read_overrides_file(name):
     overridere = re.compile("#define fGEN_TCG_([A-Za-z0-9_]+)\(.*")
-    for line in open(name, 'rt').readlines():
+    for line in open(name, "rt").readlines():
         if not overridere.match(line):
             continue
         tag = overridere.findall(line)[0]
         overrides[tag] = True
 
+
 def read_idef_parser_enabled_file(name):
     global idef_parser_enabled
     with open(name, "r") as idef_parser_enabled_file:
-- 
2.25.1


